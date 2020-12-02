import 'package:flutter/material.dart';

class AnimatedSwitcherLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnimatedSwitcherLayoutState();
  }
}

class AnimatedSwitcherLayoutState extends State<AnimatedSwitcherLayout> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedSwitcher"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              transitionBuilder: (child, animation) {
//                return ScaleTransition(
//                  scale: animation,
//                  child: child,
//                );
                return SlideTransitionX(
                  position: animation,
                  child: child,
                );
              },
              child: Text(
                "$_count",
                key: ValueKey<int>(_count),
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  _count++;
                });
              },
              child: Text("+1"),
            )
          ],
        ),
      ),
    );
  }
}

class SlideTransitionX extends AnimatedWidget {
  SlideTransitionX(
      {Key key,
      @required Animation<double> position,
      this.transformHitTests = true,
      this.child,
      this.direction = AxisDirection.down})
      : super(key: key, listenable: position) {
    switch (this.direction) {
      case AxisDirection.down:
        _tween = Tween<Offset>(begin: Offset(0, -1), end: Offset(0, 0));
        break;
      case AxisDirection.left:
        _tween = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));
        break;
      case AxisDirection.right:
        _tween = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0));
        break;
      case AxisDirection.up:
        _tween = Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0));
        break;
    }
  }

  Tween<Offset> _tween;
  final bool transformHitTests;

  final Widget child;

  //退场（出）方向
  final AxisDirection direction;

  Animation<double> get position => listenable;

  @override
  Widget build(BuildContext context) {
    Offset offset = _tween.evaluate(position);
    if (position.status == AnimationStatus.reverse) {
      switch (direction) {
        case AxisDirection.up:
          offset = Offset(offset.dx, -offset.dy);
          break;
        case AxisDirection.down:
          offset = Offset(offset.dx, -offset.dy);
          break;
        case AxisDirection.left:
          offset = Offset(-offset.dx, offset.dy);
          break;
        case AxisDirection.right:
          offset = Offset(-offset.dx, offset.dy);
          break;
      }
    }
    return FractionalTranslation(
      child: child,
      translation: offset,
      transformHitTests: transformHitTests,
    );
  }
}
