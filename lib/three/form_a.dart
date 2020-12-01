import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormA extends StatefulWidget {
  @override
  _FormAState createState() => _FormAState();
}

class _FormAState extends State<FormA> {
  GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This is form demo"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: "用户名",
                      hintText: "用户名或邮箱",
                      icon: Icon(Icons.person)),
                  validator: (v) {
                    return v
                        .trim()
                        .length > 0 ? null : "用户名不能为空";
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "密码",
                      hintText: "您的登录密码",
                      icon: Icon(Icons.lock)),
                  obscureText: true,
                  validator: (v) {
                    return v
                        .trim()
                        .length > 5 ? null : "密码不能少于6位";
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 28),
                  child: Row(
                    children: [
                      Expanded(
                          child: RaisedButton(
                            onPressed: () {
                              if ((_formKey.currentState as FormState)
                                  .validate()) {
                                //todo
                              }
                            },
                            padding: EdgeInsets.all(15),
                            child: Text("登录"),
                            textColor: Colors.white,
                            color: Theme
                                .of(context)
                                .primaryColor,
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
