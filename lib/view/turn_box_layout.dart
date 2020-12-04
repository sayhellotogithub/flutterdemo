import 'package:flutter/material.dart';

///可以以任意角度来旋转其子节点，而且可以在角度发生变化时执行一个动画以过渡到新状态，同时，我们可以手动指定动画速度
class TurnBoxLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TurnBoxLayoutState();
  }
}

class TurnBoxLayoutState extends State<TurnBoxLayout> {
  double _angle = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TurnBox Demo"),
      ),
      body: Center(
        child: Column(
          children: [
            TurnBoxView(
              speed: 5000,
              angle: _angle,
              child: Icon(
                Icons.refresh,
                size: 50,
              ),
            ),
            TurnBoxView(
              speed: 500,
              angle: _angle,
              child: Text("A"),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  _angle = _angle + 0.25;
                  print(_angle);
                });
              },
              child: Text("Change Angle"),
            )
          ],
        ),
      ),
    );
  }
}

class TurnBoxView extends StatefulWidget {
  TurnBoxView({Key key, this.speed, this.angle, this.child}) : super(key: key);

  final int speed;
  final double angle;
  final Widget child;

  @override
  State<StatefulWidget> createState() {
    return TurnBoxViewState();
  }
}

class TurnBoxViewState extends State<TurnBoxView>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, lowerBound: -double.infinity, upperBound: double.infinity);
    animationController.value = widget.angle;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: animationController,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant TurnBoxView oldWidget) {
    print("didUpdateWidget${oldWidget.angle}:${widget.angle}");

    if (oldWidget.angle != widget.angle) {
      animationController.animateTo(widget.angle,
          duration: Duration(milliseconds: widget.speed ?? 200),
          curve: Curves.easeOut);
    }
    super.didUpdateWidget(oldWidget);
  }
}
