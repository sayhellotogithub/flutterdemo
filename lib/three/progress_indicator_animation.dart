import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressIndicatorAnimation extends StatefulWidget {
  @override
  ProgressIndicatorAnimationState createState() =>
      ProgressIndicatorAnimationState();
}

class ProgressIndicatorAnimationState extends State<ProgressIndicatorAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animationController.forward();
    animationController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("自定义 动画"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: ColorTween(begin: Colors.grey, end: Colors.blue)
                      .animate(animationController),
                  value: animationController.value,
                ),
              )
            ],
          ),
        ));
  }
}
