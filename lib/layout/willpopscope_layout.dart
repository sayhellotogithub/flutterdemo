import 'package:flutter/cupertino.dart';

class WillPopScopeLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WillPopScopeLayoutState();
  }
}

class WillPopScopeLayoutState extends State<WillPopScopeLayout> {
  DateTime _lastPressedAt; //上次点击时间
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Container(
          child: Text("1秒内连续按两次返回键退出"),
          alignment: Alignment.center,
        ),
        onWillPop: () async {
          if (_lastPressedAt == null ||
              DateTime.now().difference(_lastPressedAt) >
                  Duration(seconds: 1)) {
            _lastPressedAt = DateTime.now();
            return false;
          }
          return true;
        });
  }
}
