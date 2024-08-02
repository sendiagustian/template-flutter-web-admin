import 'package:flutter/material.dart';

class NavBottomBarCustomItem {
  IconData iconData;
  String text;

  NavBottomBarCustomItem({required this.iconData, required this.text});
}

class NavBottomBarCustomWidget extends StatefulWidget {
  final List<NavBottomBarCustomItem> items;
  final String centerItemText;
  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color unselectedColor;
  final Color selectedColor;
  final NotchedShape? notchedShape;
  final ValueChanged<int> onTabSelected;
  final int selected;

  NavBottomBarCustomWidget({
    super.key,
    required this.items,
    this.centerItemText = '',
    this.height = 75.0,
    this.iconSize = 30.0,
    required this.backgroundColor,
    required this.unselectedColor,
    required this.selectedColor,
    this.notchedShape,
    required this.onTabSelected,
    required this.selected,
  }) {
    assert(items.length == 2 || items.length == 4);
  }

  @override
  State<StatefulWidget> createState() => NavBottomBarCustomWidgetState();
}

class NavBottomBarCustomWidgetState extends State<NavBottomBarCustomWidget> {
  _updateIndex(int index) {
    widget.onTabSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });
    if (widget.notchedShape != null) {
      items.insert(items.length >> 1, _buildMiddleTabItem());
    }

    return BottomAppBar(
      elevation: 15,
      height: widget.height,
      notchMargin: 10.0,
      padding: const EdgeInsets.all(4),
      color: widget.backgroundColor,
      shape: widget.notchedShape,
      surfaceTintColor: Colors.white,
      shadowColor: Colors.black,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: items,
      ),
    );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: Container(
        height: widget.height,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: widget.iconSize),
            Text(
              widget.centerItemText,
              style: TextStyle(color: widget.unselectedColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    required NavBottomBarCustomItem item,
    required int index,
    required ValueChanged<int> onPressed,
  }) {
    Color color = widget.selected == index ? widget.selectedColor : widget.unselectedColor;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: TextButton(
            onPressed: () => onPressed(index),
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(item.iconData, color: color, size: widget.iconSize),
                Text(
                  item.text,
                  style: TextStyle(color: color, fontSize: 10),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
