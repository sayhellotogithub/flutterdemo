import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// 管理TapboxA的状态。
//定义_active：确定盒子的当前颜色的布尔值。
//定义_handleTap()函数，该函数在点击该盒子时更新_active，并调用setState()更新UI。
//实现widget的所有交互式行为。
///
class TapboxA extends StatefulWidget {
  TapboxA({Key key}) : super(key: key);

  @override
  _TapboxAState createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            _active ? "active" : "Inactive",
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            color: _active ? Colors.lightGreen[700] : Colors.grey[600]),
      ),
    );
  }
}
