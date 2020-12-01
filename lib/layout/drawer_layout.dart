import 'package:flutter/material.dart';

class DrawerLayout extends StatelessWidget {
  const DrawerLayout({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 38),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ClipOval(
                        child: Image.asset(
                          "assets/images/icon_no_face.png",
                          width: 80,
                        ),
                      ),
                    ),
                    Text(
                      "Armyone",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("setting"),
                  )
                ],
              ))
            ],
          )),
    );
  }
}
