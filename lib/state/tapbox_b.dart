import 'package:flutter/material.dart';

///
/// 管理TapboxA的状态。
//定义_active：确定盒子的当前颜色的布尔值。
//定义_handleTap()函数，该函数在点击该盒子时更新_active，并调用setState()更新UI。
//实现widget的所有交互式行为。
///
class ParentWidget extends StatefulWidget {
  @override
  ParentState createState() => ParentState();
}

class ParentState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChange(bool newValue) {
    setState(() {
      _active = newValue;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapboxB(
        active: _active,
        onChange: _handleTapboxChange,
      ),
    );
  }
}

class TapboxB extends StatelessWidget {
  final bool active;
  final ValueChanged<bool> onChange;

  TapboxB({Key key, this.active: false, @required this.onChange});

  void _handleTap() {
    onChange(!active);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            active ? "active" : "Inactive",
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            color: active ? Colors.lightGreen[700] : Colors.grey[600]),
      ),
    );
  }
}
