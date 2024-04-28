import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

import '../extensions/string_extension.dart';

class DeviceInfoUtil {
  Future<DeviceInfoModel> getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    late DeviceInfoModel deviceInfoResult;

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

      deviceInfoResult = DeviceInfoModel(
        phoneModel:
            "${androidInfo.brand.capitalize()} ${androidInfo.device.toUpperCase()} (${androidInfo.model})",
        oprationSystem: "Android ${androidInfo.version.release}",
        cpu: androidInfo.board,
        sdkInt: androidInfo.version.sdkInt,
      );
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;

      deviceInfoResult = DeviceInfoModel(
        phoneModel: "${iosInfo.name} ${iosInfo.utsname.machine}",
        oprationSystem: iosInfo.systemName,
        cpu: iosInfo.utsname.machine,
        sdkInt: int.parse(iosInfo.systemVersion.split('.').first),
      );
    }

    return deviceInfoResult;
  }
}

class DeviceInfoModel {
  final String phoneModel;
  final String oprationSystem;
  final String cpu;
  final int sdkInt;

  const DeviceInfoModel({
    required this.phoneModel,
    required this.oprationSystem,
    required this.cpu,
    required this.sdkInt,
  });

  DeviceInfoModel copyWith({
    String? phoneModel,
    String? oprationSystem,
    String? cpu,
    int? sdkInt,
  }) {
    return DeviceInfoModel(
      phoneModel: phoneModel ?? this.phoneModel,
      oprationSystem: oprationSystem ?? this.oprationSystem,
      cpu: cpu ?? this.cpu,
      sdkInt: sdkInt ?? this.sdkInt,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'phoneModel': phoneModel,
      'oprationSystem': oprationSystem,
      'cpu': cpu
    };
  }

  static DeviceInfoModel fromJson(Map<String, Object?> json) {
    return DeviceInfoModel(
      phoneModel: json['phoneModel'] as String,
      oprationSystem: json['oprationSystem'] as String,
      cpu: json['cpu'] as String,
      sdkInt: json['sdkInt'] as int,
    );
  }

  @override
  String toString() {
    return '''DeviceInfoModel(
      phoneModel:$phoneModel,
      oprationSystem:$oprationSystem,
      cpu:$cpu
      sdkInt:$sdkInt
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is DeviceInfoModel &&
        other.runtimeType == runtimeType &&
        other.phoneModel == phoneModel &&
        other.oprationSystem == oprationSystem &&
        other.cpu == cpu &&
        other.sdkInt == sdkInt;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, phoneModel, oprationSystem, cpu, sdkInt);
  }
}
