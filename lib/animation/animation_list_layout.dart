import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

class AnimationListLayoutState extends State<AnimationListLayout> {
  var animationList = List<String>();

  @override
  void initState() {
    animationList.add("Scale Animation");
    animationList.add("AnimatedWidget");
    animationList.add("AnimatedBuilder");
    animationList.add("AnimationStatus");
    animationList.add("RouteAnimated");
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
    if (index == 0) {
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
    }
  }
}
