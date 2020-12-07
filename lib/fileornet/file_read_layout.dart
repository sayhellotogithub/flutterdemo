import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileReadLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FileReadLayoutState();
  }
}

class FileReadLayoutState extends State<FileReadLayout> {
  int _counter = 0;

  @override
  void initState() {
    _readCount().then((value) {
      setState(() {
        _counter = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("read string from ApplicationDocumentsDirectory"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("$_counter"),
            RaisedButton(
              onPressed: () {
                _incrementCount();
              },
              child: Text("Add"),
            )
          ],
        ),
      ),
    );
  }

  Future<File> _getLocalFile() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    return File("$dir/counter.txt");
  }

  Future<int> _readCount() async {
    try {
      File file = await _getLocalFile();
      String content = await file.readAsStringSync();
      return int.parse(content);
    } on FileSystemException {
      return 0;
    }
  }

  Future<Null> _incrementCount() async {
    setState(() {
      _counter++;
    });
    await (await _getLocalFile()).writeAsString("$_counter");
  }
}
