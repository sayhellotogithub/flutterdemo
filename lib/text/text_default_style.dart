import 'dart:ui';

import 'package:flutter/material.dart';

class TextDefaultStyle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Span"),
      ),
      body: Center(
        child: DefaultTextStyle(
          style: TextStyle(color: Colors.red, fontSize: 20),
          textAlign: TextAlign.start,
          child: Column(
            children: [
              Text("good day"),
              Text("Joy"),
              Text(
                "Joy",
                style: TextStyle(inherit: false, color: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
