import 'package:flutter/material.dart';

class SingleChildScrollViewLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scrollbar(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(6.0),
        child: Center(
          child: Column(
            children: str
                .split("")
                .map((e) => Text(
                      e,
                      textScaleFactor: 2,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
