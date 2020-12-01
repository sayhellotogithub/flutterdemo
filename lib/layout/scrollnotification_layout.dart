import 'package:flutter/material.dart';

class ScrollNotificationLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ScrollNotificationLayoutState();
  }
}

class ScrollNotificationLayoutState extends State<ScrollNotificationLayout> {
  String _progress = "%0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ScrollNotification Demo"),
      ),
      body: Scrollbar(
        child: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            double progress = notification.metrics.pixels /
                notification.metrics.maxScrollExtent;
            setState(() {
              _progress ="${(progress * 100).toInt()}%";
            });
            return true;
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("$index"),
                  );
                },
                itemCount: 30,
                itemExtent: 50,
              ),
              CircleAvatar(
                radius: 30,
                child: Text(_progress),
                backgroundColor: Colors.black54,
              )
            ],
          ),
        ),
      ),
    );
  }
}
