import 'package:flutter/material.dart';

class GradientButtonLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GradientButtonLayoutState();
  }
}

class GradientButtonLayoutState extends State<GradientButtonLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comp Demo"),
      ),
      body: Center(
        child: Column(
          children: [
            GradientButton(
              colors: [Colors.black, Colors.red],
              child: Text("Sub"),
              height: 50,
              onPress: () {},
            ),
            GradientButton(
              child: Text("Add"),
              colors: [Colors.lightGreen, Colors.green[700]],
              height: 50,
              onPress: () {},
            )
          ],
        ),
      ),
    );
  }
}

class GradientButton extends StatelessWidget {
  GradientButton(
      {this.colors,
      this.width,
      this.height,
      this.borderRadius,
      this.onPress,
      @required this.child});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: colors), borderRadius: borderRadius),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: colors.last,
          highlightColor: Colors.transparent,
          borderRadius: borderRadius,
          onTap: onPress,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: width, height: height),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: DefaultTextStyle(
                  style: TextStyle(fontWeight: FontWeight.bold),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  final List<Color> colors;
  final double width;
  final double height;
  final BorderRadius borderRadius;
  final Widget child;
  final GestureTapCallback onPress;
}
