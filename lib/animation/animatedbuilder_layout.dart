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
      body: GrowthWidget(
        animation: animation,
        child: Image.asset("assets/images/icon_no_face.png"),
      ),
//      AnimatedBuilder(
//        child: Image.asset("assets/images/icon_no_face.png"),
//        animation: animation,
//        builder: (context, child) {
//          return Center(
//            child: Container(
//              child: child,
//              width: animation.value,
//              height: animation.value,
//            ),
//          );
//        },
//      ),
    );
  }
}

class GrowthWidget extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;

  GrowthWidget({this.animation, this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      child: child,
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
    );
  }
}
