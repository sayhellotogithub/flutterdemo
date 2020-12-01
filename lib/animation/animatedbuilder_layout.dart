import 'package:flutter/material.dart';

class AnimatedBuilderLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnimatedBuilderLayoutState();
  }
}

class AnimatedBuilderLayoutState extends State<AnimatedBuilderLayout>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    animationController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    animation = Tween(begin: 0.0, end: 350.0).animate(animationController);
    animationController.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedBuilder"),
      ),
      body: AnimatedBuilder(
        child: Image.asset("assets/images/icon_no_face.png"),
        animation: animation,
        builder: (context, child) {
          return Center(
            child: Container(
              child: child,
              width: animation.value,
              height: animation.value,
            ),
          );
        },
      ),
    );
  }
}
