import 'package:flutter/material.dart';

import 'event_bus.dart';

class EventBusLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class EventBusLayoutState extends State<EventBusLayout> {
  @override
  void initState() {
    bus.on("login", (arg) {});
    super.initState();
  }

  @override
  void dispose() {
    bus.off("login");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
