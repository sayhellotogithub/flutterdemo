import 'package:flutter/material.dart';

class FlexA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("This is flex"),
        ),
        body: Column(
          children: [
            Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      height: 30,
                      color: Colors.red,
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      height: 30,
                      color: Colors.blue,
                    ))
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: SizedBox(
                height: 100,
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                          height: 30,
                          color: Colors.teal,
                        )),
                    Spacer(flex: 1),
                    Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.lightGreen,
                        ))
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
