import 'package:flutter/material.dart';

class BoxA extends StatefulWidget {
  @override
  _BoxAState createState() => _BoxAState();
}

class _BoxAState extends State<BoxA> {
  bool _switchSelected = false;
  bool _checkboxSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This is box demo"),
      ),
      body: Center(
        child: Column(
          children: [
            Switch(
                value: _switchSelected,
                onChanged: (value) {
                  setState(() {
                    _switchSelected = !_switchSelected;
                  });
                }),
            Checkbox(
                value: _checkboxSelected,
                checkColor: Colors.blue,
                onChanged: (value) {
                  setState(() {
                    _checkboxSelected = !_checkboxSelected;
                  });
                })
          ],
        ),
      ),
    );
  }
}
