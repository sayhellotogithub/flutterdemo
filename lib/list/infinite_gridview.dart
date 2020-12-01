import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfiniteGridView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InfiniteGridViewState();
}

class InfiniteGridViewState extends State<InfiniteGridView> {
  List<IconData> _icons = []; //保存Icon数据
  @override
  void initState() {
    setState(() {
      _retrieveIcons();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InfiniteGridView demo"),
      ),
      body: GridView.builder(
          itemCount: _icons.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: 2),
          itemBuilder: (context, index) {
            if (index < 200 && index == _icons.length - 1) {
              _retrieveIcons();
            }
            return Icon(_icons[index]);
          }),
    );
  }

  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access,
          Icons.cake,
          Icons.free_breakfast
        ]);
      });
    });
  }
}
