import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../themes/app_theme.dart';

class TextFieldOtpCustomWidget extends StatefulWidget {
  final OtpFieldController? controller;
  final int length;
  final double fieldWidth;
  final double spaceBetween;
  final EdgeInsets contentPadding;
  final TextInputType keyboardType;
  final bool hasError;
  final TextStyle style;
  final double outlineBorderRadius;
  final MainAxisAlignment textFieldAlignment;
  final bool obscureText;
  final bool isDense;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onCompleted;

  final List<TextInputFormatter>? inputFormatter;

  const TextFieldOtpCustomWidget({
    super.key,
    this.length = 4,
    this.controller,
    this.fieldWidth = 30,
    this.spaceBetween = 0,
    this.hasError = false,
    this.keyboardType = TextInputType.number,
    this.style = const TextStyle(),
    this.outlineBorderRadius = 10,
    this.textFieldAlignment = MainAxisAlignment.spaceBetween,
    this.obscureText = false,
    this.onChanged,
    this.inputFormatter,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
    this.isDense = false,
    this.onCompleted,
  }) : assert(length > 1);

  @override
  State<TextFieldOtpCustomWidget> createState() => _TextFieldOtpCustomState();
}

class _TextFieldOtpCustomState extends State<TextFieldOtpCustomWidget> {
  late List<FocusNode?> _focusNodes;
  late List<TextEditingController?> _textControllers;

  late List<String> _pin;

  @override
  void initState() {
    super.initState();

    if (widget.controller != null) {
      widget.controller!.setOtpTextFieldState(this);
    }

    _focusNodes = List<FocusNode?>.filled(widget.length, null, growable: false);
    _textControllers = List<TextEditingController?>.filled(widget.length, null, growable: false);

    _pin = List.generate(widget.length, (int i) {
      return '';
    });
  }

  @override
  void dispose() {
    for (var controller in _textControllers) {
      controller?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppTheme.double.screenW(context),
      child: Row(
        mainAxisAlignment: widget.textFieldAlignment,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(widget.length, (index) {
          return buildTextField(context, index);
        }),
      ),
    );
  }

  Widget buildTextField(BuildContext context, int index) {
    if (_focusNodes[index] == null) _focusNodes[index] = FocusNode();

    if (_textControllers[index] == null) {
      _textControllers[index] = TextEditingController();
    }
    final isLast = index == widget.length - 1;

    return Container(
      width: widget.fieldWidth,
      margin: EdgeInsets.only(
        right: isLast ? 0 : widget.spaceBetween,
      ),
      child: TextField(
        controller: _textControllers[index],
        keyboardType: widget.keyboardType,
        textAlign: TextAlign.center,
        style: widget.style,
        inputFormatters: widget.inputFormatter,
        maxLength: 1,
        focusNode: _focusNodes[index],
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          isDense: widget.isDense,
          filled: true,
          fillColor: Colors.white,
          counterText: '',
          contentPadding: widget.contentPadding,
          errorText: null,
          errorStyle: const TextStyle(height: 0, fontSize: 0),
        ),
        onChanged: (String str) {
          if (str.length > 1) {
            _handlePaste(str);
            return;
          }

          // Check if the current value at this position is empty
          // If it is move focus to previous text field.
          if (str.isEmpty) {
            if (index == 0) return;
            _focusNodes[index]!.unfocus();
            _focusNodes[index - 1]!.requestFocus();
          }

          // Update the current pin
          setState(() {
            _pin[index] = str;
          });

          // Remove focus
          if (str.isNotEmpty) _focusNodes[index]!.unfocus();
          // Set focus to the next field if available
          if (index + 1 != widget.length && str.isNotEmpty) {
            FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
          }

          String currentPin = _getCurrentPin();

          // if there are no null values that means otp is completed
          // Call the `onCompleted` callback function provided
          if (!_pin.contains(null) && !_pin.contains('') && currentPin.length == widget.length) {
            widget.onCompleted?.call(currentPin);
          }

          // Call the `onChanged` callback function
          if (widget.onChanged != null) {
            widget.onChanged!(currentPin);
          }
        },
      ),
    );
  }

  String _getCurrentPin() {
    String currentPin = '';
    for (var value in _pin) {
      currentPin += value;
    }
    return currentPin;
  }

  void _handlePaste(String str) {
    if (str.length > widget.length) {
      str = str.substring(0, widget.length);
    }

    for (int i = 0; i < str.length; i++) {
      String digit = str.substring(i, i + 1);
      _textControllers[i]!.text = digit;
      _pin[i] = digit;
    }

    FocusScope.of(context).requestFocus(_focusNodes[widget.length - 1]);

    String currentPin = _getCurrentPin();

    // if there are no null values that means otp is completed
    // Call the `onCompleted` callback function provided
    if (!_pin.contains(null) && !_pin.contains('') && currentPin.length == widget.length) {
      widget.onCompleted?.call(currentPin);
    }

    // Call the `onChanged` callback function
    widget.onChanged!(currentPin);
  }
}

class OtpFieldController {
  late _TextFieldOtpCustomState _otpTextFieldState;

  void setOtpTextFieldState(state) {
    _otpTextFieldState = state;
  }

  void clear() {
    final textFieldLength = _otpTextFieldState.widget.length;
    _otpTextFieldState._pin = List.generate(textFieldLength, (int i) {
      return '';
    });

    final textControllers = _otpTextFieldState._textControllers;
    for (var textController in textControllers) {
      if (textController != null) {
        textController.text = '';
      }
    }

    final firstFocusNode = _otpTextFieldState._focusNodes[0];
    if (firstFocusNode != null) {
      firstFocusNode.requestFocus();
    }
  }

  void set(List<String> pin) {
    final textFieldLength = _otpTextFieldState.widget.length;
    if (pin.length < textFieldLength) {
      throw Exception('Pin length must be same as field length. Expected: $textFieldLength, Found ${pin.length}');
    }

    _otpTextFieldState._pin = pin;
    String newPin = '';

    final textControllers = _otpTextFieldState._textControllers;
    for (int i = 0; i < textControllers.length; i++) {
      final textController = textControllers[i];
      final pinValue = pin[i];
      newPin += pinValue;

      if (textController != null) {
        textController.text = pinValue;
      }
    }

    final widget = _otpTextFieldState.widget;

    widget.onChanged?.call(newPin);

    widget.onCompleted?.call(newPin);
  }

  void setValue(String value, int position) {
    final maxIndex = _otpTextFieldState.widget.length - 1;
    if (position > maxIndex) {
      throw Exception('Provided position is out of bounds for the OtpTextField');
    }

    final textControllers = _otpTextFieldState._textControllers;
    final textController = textControllers[position];
    final currentPin = _otpTextFieldState._pin;

    if (textController != null) {
      textController.text = value;
      currentPin[position] = value;
    }

    String newPin = '';
    for (var item in currentPin) {
      newPin += item;
    }

    final widget = _otpTextFieldState.widget;
    if (widget.onChanged != null) {
      widget.onChanged!(newPin);
    }
  }

  void setFocus(int position) {
    final maxIndex = _otpTextFieldState.widget.length - 1;
    if (position > maxIndex) {
      throw Exception('Provided position is out of bounds for the OtpTextField');
    }

    final focusNodes = _otpTextFieldState._focusNodes;
    final focusNode = focusNodes[position];

    if (focusNode != null) {
      focusNode.requestFocus();
    }
  }
}
