import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfiniteListView extends StatefulWidget {
  @override
  InfiniteListViewState createState() {
    return InfiniteListViewState();
  }
}

class InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = "##loading##";
  var _words = <String>[loadingTag];

  @override
  void initState() {
    _retrieveData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Infinite ListView"),
        ),
        body: Column(
          children: [
            ListTile(
              title: Text(
                "Word list",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      if (_words[index] == loadingTag) {
                        if (_words.length - 1 < 100) {
                          _retrieveData();
                          return Container(
                            padding: EdgeInsets.all(16),
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            padding: EdgeInsets.all(16),
                            alignment: Alignment.center,
                            child: Text("没有更多的数据"),
                          );
                        }
                      }
                      return ListTile(
                        title: Text("${_words[index]}"),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(height: 0);
                    },
                    itemCount: _words.length)),
          ],
        ));
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((value) => {
          setState(() {
            _words.insertAll(
                _words.length - 1,
                generateWordPairs()
                    .take(20)
                    .map((e) => e.asPascalCase)
                    .toList());
          })
        });
  }
}
