import 'package:flutter/material.dart';

class ShareInheritedWidget extends InheritedWidget {
  ShareInheritedWidget({@required this.data, Widget child})
      : super(child: child);

  final int data;

//  static ShareInheritedWidget of(BuildContext context) {
//    return context.dependOnInheritedWidgetOfExactType<ShareInheritedWidget>();
//  }

  static ShareInheritedWidget of(BuildContext context) {
    //return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
    return context.getElementForInheritedWidgetOfExactType<ShareInheritedWidget>().widget;
  }
  @override
  bool updateShouldNotify(covariant ShareInheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return oldWidget.data != data;
  }
}

class _TestShareInheritedWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TestShareInheritedWidgetState();
  }
}

class _TestShareInheritedWidgetState extends State<_TestShareInheritedWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(ShareInheritedWidget.of(context).data.toString());
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}

class InheritedWidgetLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InheritedWidgetLayoutState();
  }
}

class InheritedWidgetLayoutState extends State<InheritedWidgetLayout> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InheritedWidget Demo"),
      ),
      body: Center(
        child: ShareInheritedWidget(
          data: count,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: _TestShareInheritedWidget(),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    count++;
                  });
                },
                child: Text("add"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
