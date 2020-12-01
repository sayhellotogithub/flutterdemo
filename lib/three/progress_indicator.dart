import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressIndicatorA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Progress Indicator"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                )),
            SizedBox(
                height: 3,
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                  value: 0.5,
                )),
            CircularProgressIndicator(
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
            SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
