import 'package:flutter/material.dart';
import 'package:flutterdemo/util/font_utils.dart';

class TextFontFamily extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text font family"),
      ),
      body: Center(
        child: Text(
          "Use the font for this font",
          style: FontUtils.textStyle,
        ),
      ),
    );
  }
}
