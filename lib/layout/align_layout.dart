import 'package:flutter/material.dart';

class AlignLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("algin demo"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 120,
              width: 120,
              color: Colors.blue[50],
              child: Align(
                alignment: Alignment.topCenter,
                child: FlutterLogo(
                  size: 60,
                ),
              ),
            ),
            Container(
              height: 120,
              width: 120,
              color: Colors.blue[50],
              child: Align(
                alignment: FractionalOffset(0.2, 0.6),
                child: FlutterLogo(
                  size: 60,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
