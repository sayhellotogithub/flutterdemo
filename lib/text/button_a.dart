import 'package:flutter/material.dart';

class ButtonA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This is button demo"),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              onPressed: () {},
              child: Text("RaisedButton"),
            ),
            FlatButton(onPressed: () {}, child: Text("FlatButton")),
            OutlineButton(
              onPressed: () {},
              child: Text("OutlineButton"),
            ),
            IconButton(icon: Icon(Icons.thumb_up), onPressed: () {}),
            FlatButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text("Submit"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
