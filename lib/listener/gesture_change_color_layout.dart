import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GestureChangeColorLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GestureChangeColorLayoutState();
  }
}

class GestureChangeColorLayoutState extends State<GestureChangeColorLayout> {
  TapGestureRecognizer _gestureRecognizer = TapGestureRecognizer();
  bool _toggle = false;

  @override
  void initState() {
    _gestureRecognizer.onTap = () {
      setState(() {
        _toggle = !_toggle;
      });
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GestureChangeColor"),
      ),
      body: Center(
        child: Text.rich(TextSpan(children: [
          TextSpan(text: "Good Day"),
          TextSpan(
              text: "   click me change color",
              style: TextStyle(
                  color: _toggle ? Colors.black : Colors.red, fontSize: 18,),
              recognizer: _gestureRecognizer),
        ])),
      ),
    );
  }
}
