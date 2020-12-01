import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StackPositionLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This is stack and position demo"),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              child: Text(
                "good day",
                style: TextStyle(color: Colors.black),
              ),
              color: Colors.red,
            ),
            Positioned(child: Text("I'm back"), top: 18),
            Positioned(
              child: Text("You friend"),
              left: 18,
            )
          ],
        ),
      ),
    );
  }
}
