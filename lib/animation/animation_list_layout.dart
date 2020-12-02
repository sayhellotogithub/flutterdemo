import 'package:flutter/material.dart';
import 'package:flutterdemo/animation/hero_animated_layout.dart';
import 'package:flutterdemo/animation/stagger_animation_layout.dart';

import 'animated_decoratedbox_layout.dart';
import 'animated_switcher_layout.dart';
import 'animated_widget_layout.dart';
import 'animatedbuilder_layout.dart';
import 'route_animated_layout.dart';
import 'scale_animation_layout.dart';
import 'scale_animation_no_stop_layout.dart';

class AnimationListLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnimationListLayoutState();
  }
}

const ANIMATED_DECORATEDBOX = "AnimatedDecoratedBox";
const SCALE_ANIMATION = "ScaleAnimation";

class AnimationListLayoutState extends State<AnimationListLayout> {
  var animationList = List<String>();

  @override
  void initState() {
    animationList.add(SCALE_ANIMATION);
    animationList.add("AnimatedWidget");
    animationList.add("AnimatedBuilder");
    animationList.add("AnimationStatus");
    animationList.add("RouteAnimated");
    animationList.add("HeroAnimated");
    animationList.add("StaggerAnimation");
    animationList.add("AnimatedSwitcher");
    animationList.add(ANIMATED_DECORATEDBOX);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation List"),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("${animationList[index]}"),
              onTap: () {
                itemTap(index);
              },
            );
          },
          itemCount: animationList.length,
        ),
      ),
    );
  }

  void itemTap(int index) {
    if (animationList[index].startsWith(SCALE_ANIMATION)) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ScaleAnimationLayout();
      }));
    } else if (index == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return AnimatedWidgetLayout();
      }));
    } else if (index == 2) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return AnimatedBuilderLayout();
      }));
    } else if (index == 3) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ScaleAnimationNoStopLayout();
      }));
    } else if (index == 4) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return RouteAnimatedLayout();
      }));
    } else if (index == 5) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HeroAnimatedLayout();
      }));
    } else if (index == 6) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return StaggerAnimationLayout();
      }));
    } else if (index == 7) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return AnimatedSwitcherLayout();
      }));
    } else if (animationList[index].startsWith(ANIMATED_DECORATEDBOX)) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return AnimatedDecoratedBoxLayout();
      }));
    }
  }
}
