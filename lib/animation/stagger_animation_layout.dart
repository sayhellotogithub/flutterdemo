import 'package:flutter/material.dart';

class StaggerAnimationLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StaggerAnimationLayoutState();
  }
}

class StaggerAnimationLayoutState extends State<StaggerAnimationLayout>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Future<Null> _playAnimation() async {
    try {
      await animationController.forward().orCancel;
      await animationController.reverse().orCancel;
    } on TickerCanceled {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stagger Animation Demo"),
      ),
      body: GestureDetector(
        onTap: () {
          _playAnimation();
        },
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: Container(
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                border: Border.all(color: Colors.black.withOpacity(0.5))),
            child: StaggerAnimation(
              animation: animationController,
            ),
          ),
        ),
      ),
    );
  }
}

///开始时高度从0增长到300像素，同时颜色由绿色渐变为红色；这个过程占据整个动画时间的60%。
///高度增长到300后，开始沿X轴向右平移100像素；这个过程占用整个动画时间的40%。
class StaggerAnimation extends StatelessWidget {
  StaggerAnimation({Key key, this.animation}) : super(key: key) {
    heightAnimation = Tween(begin: 0.0, end: 300.0).animate(CurvedAnimation(
        parent: animation, curve: Interval(0.0, 0.6, curve: Curves.ease)));
    colorAnimation = ColorTween(begin: Colors.green, end: Colors.red).animate(
        CurvedAnimation(
            parent: animation, curve: Interval(0.0, 0.6, curve: Curves.ease)));
    paddingAnimation = Tween<EdgeInsets>(
            begin: EdgeInsets.only(left: 0.0),
            end: EdgeInsets.only(left: 100.0))
        .animate(CurvedAnimation(
            parent: animation, curve: Interval(0.6, 1, curve: Curves.ease)));
  }

  Animation<double> heightAnimation;
  Animation<EdgeInsets> paddingAnimation;
  Animation<Color> colorAnimation;
  AnimationController animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: animation, builder: _buildAnimation);
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: paddingAnimation.value,
      child: Container(
        color: colorAnimation.value,
        width: 50.0,
        height: heightAnimation.value,
      ),
    );
  }
}
