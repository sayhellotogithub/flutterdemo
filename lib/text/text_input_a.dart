import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextInputA extends StatelessWidget {
  TextEditingController _textEditingController =
      TextEditingController(text: "hello world");

  @override
  Widget build(BuildContext context) {
    _textEditingController.selection = TextSelection(
        baseOffset: 2, extentOffset: _textEditingController.text.length);

    return Scaffold(
      appBar: AppBar(
        title: Text("输入框及表单"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  prefixIcon: Icon(Icons.person)),
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "10位文字",
                  prefixIcon: Icon(Icons.lock)),
              obscureText: true,
              obscuringCharacter: "*",
            ),
            TextField(
              decoration: InputDecoration(labelText: "TextEditingController"),
              controller: _textEditingController,
            ),
            TextField(
              decoration: InputDecoration(labelText: "fouce One"),
            ),
            FocusRoute()
          ],
        ),
      ),
    );
  }
}

class FocusRoute extends StatefulWidget {
  @override
  _FocusRouteState createState() => _FocusRouteState();
}

class _FocusRouteState extends State<FocusRoute> {
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode scopeNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6.0),
      child: Column(
        children: [
          TextField(
            autofocus: true,
            focusNode: focusNode1,
            decoration: InputDecoration(labelText: "input 1"),
          ),
          TextField(
            focusNode: focusNode2,
            decoration: InputDecoration(labelText: "input 2"),
          ),
          RaisedButton(
              child: Text("移动焦点"),
              onPressed: () {
                //将焦点从第一个TextField移到第二个TextField
                // 这是一种写法 FocusScope.of(context).requestFocus(focusNode2);
                // 这是第二种写法
                if (null == scopeNode) {
                  scopeNode = FocusScope.of(context);
                }
                scopeNode.requestFocus(focusNode2);
              }),
          RaisedButton(
            onPressed: () {
              focusNode1.unfocus();
              focusNode2.unfocus();
            },
            child: Text("隐藏焦点"),
          )
        ],
      ),
    );
  }
}
