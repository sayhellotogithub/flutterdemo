import 'package:flutter/material.dart';

class TextA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Span"),
      ),
      body: Center(
        child: Text.rich(TextSpan(children: [
          TextSpan(text: "home"),
          TextSpan(
              text: "https://flutterchina.club",
              style: TextStyle(color: Colors.blue))
        ])),
      ),
    );
  }
}
