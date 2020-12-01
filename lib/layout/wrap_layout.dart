import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WrapLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("flow layout"),
      ),
      body: Column(children: [
        Row(
          children: [Text("xxx" * 100)],
        ),
        Row(
          children: [Text("&&&" * 100)],
        ),
        Wrap(
          spacing: 8,
          alignment: WrapAlignment.center,
          children: [Text("xxx" * 100)],
        ),
        Wrap(
          spacing: 8,
          runSpacing: 10,
          alignment: WrapAlignment.center,
          children: [
            Chip(
              label: Text("Hamilton"),
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("A"),
              ),
            ),
            Chip(
              label: Text("Hamilton"),
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("B"),
              ),
            ),
            Chip(
              label: Text("Hamilton"),
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("C"),
              ),
            ),
            Chip(
              label: Text("Hamilton"),
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("D"),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
