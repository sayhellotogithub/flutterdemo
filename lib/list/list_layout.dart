import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDE";
    var strBuilder = List();
    strBuilder.add("1");
    strBuilder.add("2");
    strBuilder.add("3");
    strBuilder.add("4");

    Widget divider1 = Divider(
      color: Colors.red,
    );
    Widget divider2 = Divider(color: Colors.green);
    return Scaffold(
        appBar: AppBar(
          title: Text("list view"),
        ),
        body: Center(

//          ListView(
//            shrinkWrap: true,
//            padding: EdgeInsets.all(20),
//            children: str
//                .split("")
//                .map((e) => Text(
//                      e,
//                      textScaleFactor: 2,
//                    ))
//                .toList(),
//          ),
            child: Expanded(
          child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text("${strBuilder[index]}"),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                if (index % 2 == 0) {
                  return divider1;
                }
                return divider2;
              },
              itemCount: strBuilder.length),
        )
//            ListView.builder(
//                itemCount: strBuilder.length,
//                itemExtent: 50,
//                itemBuilder: (BuildContext context, int index) {
//                  return ListTile(
//                    title: Text("${strBuilder[index]}strBuilder"),
//                  );
//                })
            ));
  }
}
