import 'package:flutter/material.dart';

class StateDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class StateDemoState extends State<StateDemo> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Builder(
          builder: (context) {
            return RaisedButton(
              onPressed: () {

                ScaffoldState scaffoldState = context.findAncestorStateOfType();
                scaffoldState.showSnackBar(SnackBar(content: Text("snack")));
              },
              child: Text("show snak bar"),
            );
          },
        ),
      ),
    );
  }
}
