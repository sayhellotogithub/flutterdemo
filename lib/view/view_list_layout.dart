import 'package:flutter/material.dart';
import 'package:flutterdemo/view/go_bang_layout.dart';
import 'package:flutterdemo/view/turn_box_layout.dart';

import 'gradient_button_layout.dart';

class ViewListLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ViewListLayoutState();
  }
}

const GRADIENT_BUTTON = "GradientButton";
const TURN_BOX = "TurnBox";
const GO_BANG = "GoBang";

class ViewListLayoutState extends State<ViewListLayout> {
  var animationList = List<String>();

  @override
  void initState() {
    animationList.add(GRADIENT_BUTTON);
    animationList.add(TURN_BOX);
    animationList.add(GO_BANG);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View List"),
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
    if (animationList[index].startsWith(GRADIENT_BUTTON)) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return GradientButtonLayout();
      }));
    } else if (animationList[index].startsWith(TURN_BOX)) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return TurnBoxLayout();
      }));
    } else if (animationList[index].startsWith(GO_BANG)) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return GoBangLayout();
      }));
    }
  }
}
