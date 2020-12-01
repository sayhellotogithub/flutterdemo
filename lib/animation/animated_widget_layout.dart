import 'package:flutter/material.dart';

class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Image.asset(
        "assets/images/icon_no_face.png",
        width: animation.value,
        height: animation.value,
      ),
    );
  }
}

class AnimatedWidgetLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnimatedWidgetLayoutState();
  }
}

class AnimatedWidgetLayoutState extends State<AnimatedWidgetLayout>
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
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedWidget"),
      ),
      body: AnimatedImage(
        animation: animation,
      ),
    );
  }
}
