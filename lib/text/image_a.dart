import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This is image"),
      ),
      body: Center(
        child: Column(
          children: [
            Image(
              image: AssetImage("assets/images/icon_no_face.png"),
              width: 100,
            ),
            Image.asset(
              "assets/images/icon_cactus_cacti_avatar_pirate.png",
              width: 100,
            ),
            Image(
              image: NetworkImage(
                  "https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/girl_female_woman_avatar-512.png"),
              width: 100,
            ),
            Image(
              image: AssetImage("assets/images/icon_girl_avatar_child_kid.png"),
              width: 100,
              color: Colors.blue,
              colorBlendMode: BlendMode.colorDodge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.accessible,
                  color: Colors.green,
                ),
                Icon(
                  Icons.error,
                  color: Colors.green,
                ),
                Icon(
                  Icons.fingerprint,
                  color: Colors.green,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
