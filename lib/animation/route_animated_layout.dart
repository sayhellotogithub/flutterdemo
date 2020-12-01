import 'package:flutter/material.dart';

import 'animatedbuilder_layout.dart';

class RouteAnimatedLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RouteAnimatedLayoutState();
  }
}

class RouteAnimatedLayoutState extends State<RouteAnimatedLayout> {
  var routeList = List<String>();

  @override
  void initState() {
    routeList.add("PageRouteBuilder");
    routeList.add("Extends PageRoute");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RouteAnimated"),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("${routeList[index]}"),
              onTap: () {
                if (index == 0) {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 500),
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return FadeTransition(
                              opacity: animation,
                              child: AnimatedBuilderLayout(),
                            );
                          }));
                } else {
                  Navigator.push(context, FadeRoute(builder: (context) {
                    return AnimatedBuilderLayout();
                  }));
                }
              },
            );
          },
          itemCount: routeList.length,
        ),
      ),
    );
  }
}

class FadeRoute extends PageRoute {
  FadeRoute({
    @required this.builder,
    this.transitionDuration = const Duration(milliseconds: 300),
    this.opaque = true,
    this.barrierDismissible = false,
    this.barrierColor,
    this.barrierLabel,
    this.maintainState = true,
  });

  final WidgetBuilder builder;
  @override
  final Duration transitionDuration;
  @override
  final bool barrierDismissible;

  @override
  final Color barrierColor;

  @override
  final String barrierLabel;

  @override
  final bool maintainState;

  @override
  final bool opaque;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (isActive) {
      return FadeTransition(
        opacity: animation,
        child: builder(context),
      );
    } else {
      return Padding(
        padding: EdgeInsets.zero,
      );
    }
  }
}
