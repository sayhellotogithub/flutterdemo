import 'package:flutter/material.dart';

class HeroAnimatedLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero Animated"),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: InkWell(
          child: Hero(
            tag: "avator",
            child: ClipOval(
              child: Image.asset(
                "assets/images/icon_no_face.png",
                width: 50,
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context, PageRouteBuilder(
                pageBuilder: (context, animation, secondAnimation) {
              return FadeTransition(
                  opacity: animation, child: HeroAnimationRoute());
            }));
          },
        ),
      ),
    );
  }
}

class HeroAnimationRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("source pic"),
      ),
      body: Center(
        child: Hero(
          tag: "avator",
          child: Image.asset("assets/images/icon_no_face.png"),
        ),
      ),
    );
  }
}
