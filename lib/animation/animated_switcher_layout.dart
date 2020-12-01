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
                return ScaleTransition(
                  scale: animation,
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
