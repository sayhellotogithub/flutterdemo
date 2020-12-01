import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextInputDecoration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This is Decoratin Demo"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: "email 地址",
                    hintText: "电子邮箱",
                    prefixIcon: Icon(Icons.email),
                    border: InputBorder.none),
              ),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey[200], width: 1))),
            )
          ],
        ),
      ),
    );
  }
}
