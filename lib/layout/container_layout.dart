import 'package:flutter/material.dart';

class ContainerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 50, left: 120),
          constraints: BoxConstraints.tightFor(width: 200, height: 150),
          decoration: BoxDecoration(
              gradient: RadialGradient(
                  colors: [Colors.red, Colors.orange],
                  center: Alignment.topLeft,
                  radius: 0.88),
              boxShadow: [
                BoxShadow(
                    color: Colors.black54,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 4.0)
              ]),
          transform: Matrix4.rotationZ(0.2),
          alignment: Alignment.center,
          child: Text(
            "5.2",
            style: TextStyle(color: Colors.white, fontSize: 40.0),
          ),
        ),
      ),
    );
  }
}
