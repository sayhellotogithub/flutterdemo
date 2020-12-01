import 'dart:ffi';

import 'package:flutter/material.dart';

/// 实现缩放动画
class ScaleAnimationLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScaleAnimationLayoutState();
  }
}

class ScaleAnimationLayoutState extends State<ScaleAnimationLayout>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    animation = Tween(begin: 0.0, end: 300.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.bounceIn))
      ..addListener(() {
        setState(() {});
      });

    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("scale animation"),
      ),
      body: Center(
        child: Image.asset(
          "assets/images/icon_no_face.png",
          width: animation.value,
          height: animation.value,
        ),
      ),
    );
  }
}
