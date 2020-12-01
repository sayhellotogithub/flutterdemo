import 'package:flutter/material.dart';

class NotificationLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NotificationLayoutState();
  }
}

class NotificationLayoutState extends State<NotificationLayout> {
  String _notifiationString = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Notification Demo"),
        ),
        body: NotificationListener<MyNotification>(
          onNotification: (notification) {
            setState(() {
              _notifiationString += notification.msg;
            });
            return true;
          },
          child: Center(
            child: Column(
              children: [
                Text(_notifiationString),
                Builder(builder: (context) {
                  return RaisedButton(
                    onPressed: () {
                      MyNotification("Hi").dispatch(context);
                    },
                    child: Text("Click me send a Notification"),
                  );
                })
              ],
            ),
          ),
        ));
  }
}

class MyNotification extends Notification {
  MyNotification(this.msg);

  final String msg;
}
