import 'package:flutter/material.dart';

class DialogLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dialog Demo"),
      ),
      body: Center(
          child: Column(
        children: [
          RaisedButton(
            child: Text("对话框1"),
            onPressed: () async {
              bool delete = await showDeleteConfirmDialog1(context);
              if (delete == null) {
                print("取消删除");
              } else {
                print("已确认删除");
                //... 删除文件
              }
            },
          ),
          RaisedButton(
            onPressed: () {
              showListDialog(context);
            },
            child: Text("自定义对话框"),
          ),
          RaisedButton(
            onPressed: () {
              showCustomDialog(context);
            },
            child: Text("自定义 Dialog"),
          ),
          RaisedButton(
            onPressed: () {
              showCustomDialogTwo(context);
            },
            child: Text("自定义 Dialog1"),
          ),
          RaisedButton(
            onPressed: () {
              showLoadingDialog(context);
            },
            child: Text("自定Loading 对话框"),
          )
        ],
      )),
    );
  }

  Future<void> showCustomDialogTwo(BuildContext context) async {
    await showCustomDialogSelf<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text("您确定要删除当前文件吗?"),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                // 执行删除操作
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> showCustomDialog(BuildContext context) async {
    int index = await showDialog(
        context: context,
        builder: (BuildContext context) {
          var child = Column(
            children: [
              ListTile(
                title: Text("请选择"),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: 30,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text("$index"),
                          onTap: () => Navigator.of(context).pop(index),
                        );
                      }))
            ],
          );

          return UnconstrainedBox(
            constrainedAxis: Axis.vertical,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 280),
              child: Material(
                child: child,
                type: MaterialType.card,
              ),
            ),
          );
        });
  }

  Future<bool> showDeleteConfirmDialog1(BuildContext context) {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示"),
            content: Text("你确定要删除当前文件"),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("取消")),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text("删除"))
            ],
          );
        });
  }

  Future<void> showListDialog(BuildContext context) async {
    int index = await showDialog(
        context: context,
        builder: (BuildContext context) {
          var child = Column(
            children: [
              ListTile(
                title: Text("请选择"),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: 30,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text("$index"),
                          onTap: () => Navigator.of(context).pop(index),
                        );
                      }))
            ],
          );
          return Dialog(
            child: child,
          );
        });

    if (index != null) {
      print("点击了：$index");
    }
  }

  Future<T> showCustomDialogSelf<T>({
    @required BuildContext context,
    bool barrierDismissible = true,
    WidgetBuilder builder,
  }) {
    final ThemeData theme = Theme.of(context, shadowThemeOnly: true);
    return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        final Widget pageChild = Builder(builder: builder);
        return SafeArea(
          child: Builder(builder: (BuildContext context) {
            return theme != null
                ? Theme(data: theme, child: pageChild)
                : pageChild;
          }),
        );
      },
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black87,
      // 自定义遮罩颜色
      transitionDuration: const Duration(milliseconds: 150),
      transitionBuilder: _buildMaterialDialogTransitions,
    );
  }

  Widget _buildMaterialDialogTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    // 使用缩放动画
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      ),
      child: child,
    );
  }

  showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, //点击遮罩不关闭对话框
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircularProgressIndicator(),
              Padding(
                padding: const EdgeInsets.only(top: 26.0),
                child: Text("正在加载，请稍后..."),
              )
            ],
          ),
        );
      },
    );
  }
}
