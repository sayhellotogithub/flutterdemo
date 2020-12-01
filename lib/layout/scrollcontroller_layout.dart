import 'package:flutter/material.dart';

class ScrollControllerLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ScrollControllerLayoutState();
  }
}

class ScrollControllerLayoutState extends State<ScrollControllerLayout> {
  ScrollController _controller = ScrollController();
  bool showTopBar = false;

  @override
  void initState() {

    super.initState();
    _controller.addListener(() {
      print(":${_controller.offset}:${_controller.keepScrollOffset}");
      if (_controller.offset > 1000 && !showTopBar) {
        setState(() {
          showTopBar = true;
        });
      } else if (_controller.offset < 1000 && showTopBar) {
        setState(() {
          showTopBar = false;
        });
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    double offset =
    PageStorage.of(context).readState(context, identifier: 'offset');
    print("didChangeDependencies$offset");
    if (offset != null) {
      _controller.animateTo(offset,
          duration: Duration(milliseconds: 200), curve: Curves.bounceIn);
    }

  }

  @override
  void deactivate() {
    print(_controller.offset);

    PageStorage.of(context)
        .writeState(context, _controller.offset, identifier: 'offset');

    super.deactivate();
  }

  @override
  void dispose() {

    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ScrollController"),
      ),
      body: Scrollbar(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("$index"),
            );
          },
          itemCount: 40,
          itemExtent: 50,
          controller: _controller,
        ),
      ),
      floatingActionButton: showTopBar
          ? FloatingActionButton(
          onPressed: () {
            _controller.animateTo(0,
                duration: Duration(milliseconds: 200), curve: Curves.ease);
          },
          child: Icon(Icons.arrow_upward))
          : null,
    );
  }
}
