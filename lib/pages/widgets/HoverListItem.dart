import 'package:flutter/material.dart';
class HoverListItem extends StatefulWidget {
  final int index;

  const HoverListItem({Key? key, required this.index}) : super(key: key);

  @override
  _HoverListItemState createState() => _HoverListItemState();
}

class _HoverListItemState extends State<HoverListItem> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => _isHovering = true),
      onExit: (event) => setState(() => _isHovering = false),
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: _isHovering ? Colors.blue.withOpacity(0.5) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.blue),
        ),
        child: Text('Item ${widget.index}', style: TextStyle(color: _isHovering ? Colors.white : Colors.blue)),
      ),
    );
  }
}