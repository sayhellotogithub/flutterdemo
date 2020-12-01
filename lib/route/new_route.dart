import 'package:flutter/material.dart';

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("new Route"),
      ),
      body: Center(child:Text("This is New Route"),),
    );
  }
}
