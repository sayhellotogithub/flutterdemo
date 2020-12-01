import 'package:flutter/material.dart';

class DialogStateLayoutState extends State<DialogStateLayout> {
  bool withTree = false;

  bool withTreeOne = false;
  bool withTreeTwo = false;

  bool withTreeThree = false;

  bool withTreeFour = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DialogStateLayout "),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              onPressed: () {
                showNoKeepState(context);
              },
              child: Text("未保存状态"),
            ),
            RaisedButton(
              onPressed: () {
                showKeepStateOne(context);
              },
              child: Text("保存状态"),
            ),
            RaisedButton(
              onPressed: () {
                showKeepStatetwo(context);
              },
              child: Text("保存状态2"),
            ),
            RaisedButton(
              onPressed: () {
                showKeepStatethree(context);
              },
              child: Text("保存状态3"),
            )
          ],
        ),
      ),
    );
  }

  Future<void> showNoKeepState(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("delete dir"),
                Checkbox(
                    value: withTree,
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        withTree = !withTree;
                      });
                    })
              ],
            ),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("取消"))
            ],
          );
        });
  }

  Future<void> showKeepStateOne(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("delete dir"),
                DialogCheckBox(
                    value: withTreeOne,
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        withTreeOne = !withTreeOne;
                      });
                    }),
                DialogCheckBox(
                    value: withTreeTwo,
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        withTreeTwo = !withTreeTwo;
                      });
                    })
              ],
            ),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("取消"))
            ],
          );
        });
  }

  Future<void> showKeepStatetwo(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("delete dir"),
                StatefullBuilder(builder: (context, _setState) {
                  return Checkbox(
                      value: withTreeThree,
                      onChanged: (value) {
                        _setState(() {
                          withTreeThree = !withTreeThree;
                        });
                      });
                })
              ],
            ),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("取消"))
            ],
          );
        });
  }

  Future<void> showKeepStatethree(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("delete dir"),
                Builder(builder: (context) {
                  return Checkbox(
                    value: withTreeFour,
                    onChanged: (value) {
                      (context as Element).markNeedsBuild();
                      withTreeFour = !withTreeFour;
                    },
                  );
                })
              ],
            ),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("取消"))
            ],
          );
        });
  }
}

class DialogStateLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DialogStateLayoutState();
  }
}

class DialogCheckBox extends StatefulWidget {
  DialogCheckBox({
    Key key,
    this.value,
    @required this.onChanged,
  });

  final ValueChanged<bool> onChanged;
  final bool value;

  @override
  _DialogCheckboxState createState() => _DialogCheckboxState();
}

class _DialogCheckboxState extends State<DialogCheckBox> {
  bool value;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: (v) {
        //将选中状态通过事件的形式抛出
        widget.onChanged(v);
        setState(() {
          //更新自身选中状态
          value = v;
        });
      },
    );
  }
}

class StatefullBuilder extends StatefulWidget {
  StatefullBuilder({Key key, @required this.builder})
      : assert(builder != null),
        super(key: key);

  final StatefulWidgetBuilder builder;

  @override
  State<StatefulWidget> createState() {
    return StatefullBuilderState();
  }
}

class StatefullBuilderState extends State<StatefullBuilder> {
  @override
  Widget build(BuildContext context) {
    return widget.builder(context, setState);
  }
}
