import 'package:flutter/material.dart';

import 'file_read_layout.dart';

class FileOrNetListLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FileOrNetListLayoutState();
  }
}

const FILE_READ = "FileRead";

class FileOrNetListLayoutState extends State<FileOrNetListLayout> {
  var animationList = List<String>();

  @override
  void initState() {
    animationList.add(FILE_READ);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FileOrNetList"),
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
    if (animationList[index].startsWith(FILE_READ)) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return FileReadLayout();
      }));
    }
  }
}
