import 'package:flutter/material.dart';

class GestureLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GestureLayoutState();
  }
}

class GestureLayoutState extends State<GestureLayout>
    with SingleTickerProviderStateMixin {
  double _top = 0.0;
  double _left = 0.0;

  String _operation = "No Gesture detected";

  void updateText(String text) {
    //更新显示的事件名
    setState(() {
      _operation = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gestrue demo"),
      ),
      body: Stack(
        children: [
          Center(
            child: GestureDetector(
              child: Container(
                alignment: Alignment.center,
                color: Colors.blue,
                width: 200,
                height: 200,
                child: Text(
                  _operation,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onTap: () {
                updateText("Tap");
              },
              onDoubleTap: () {
                updateText("onDoubleTap");
              },
              onLongPress: () {
                updateText("onLongPress");
              },
            ),
          ),
          Positioned(
            child: GestureDetector(
              child: CircleAvatar(
                child: Text("A"),
              ),
              onPanDown: (e) {
                print("${e.globalPosition}");
              },
              onPanUpdate: (e) {
                setState(() {
                  _top += e.delta.dx;
                  _left += e.delta.dy;
                });
              },
              onPanEnd: (e) {
                print("${e.velocity}");
              },
            ),
            top: _top,
            left: _left,
          )
        ],
      ),
    );
  }
}
