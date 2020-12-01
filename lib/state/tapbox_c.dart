import 'package:flutter/material.dart';

///
/// 管理TapboxA的状态。
//定义_active：确定盒子的当前颜色的布尔值。
//定义_handleTap()函数，该函数在点击该盒子时更新_active，并调用setState()更新UI。
//实现widget的所有交互式行为。
///
class ParentWidgetC extends StatefulWidget {
  @override
  ParentState createState() => ParentState();
}

class ParentState extends State<ParentWidgetC> {
  bool _active = false;

  void _handleTapboxChange(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapboxC(
        active: _active,
        onChange: _handleTapboxChange,
      ),
    );
  }
}

class TapboxC extends StatefulWidget {
  final bool active;
  final ValueChanged<bool> onChange;

  TapboxC({Key key, this.active: false, @required this.onChange});

  @override
  _TapboxCState createState() => _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {
  bool _highlight = false;

  void _handleTap() {
    widget.onChange(!widget.active);
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTapCancel: _handleTapCancel,
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            widget.active ? "active" : "Inactive",
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            border: _highlight
                ? Border.all(color: Colors.teal[700], width: 10)
                : null,
            color: widget.active ? Colors.lightGreen[700] : Colors.grey[600]),
      ),
    );
  }
}
