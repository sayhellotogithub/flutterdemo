import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TipRoute extends StatelessWidget {
  TipRoute({Key key, @required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This is tip route"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
            child: Column(
          children: [
            Text(text),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context, "this is back tip");
              },
              child: Text("返回"),
            )
          ],
        )),
      ),
    );
  }
}
