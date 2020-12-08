import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/common/git_api.dart';
import 'package:flutterdemo/internation/demo_localization.dart';
import 'package:flutterdemo/models/repo.dart';
import 'package:flutterdemo/state/profile_change_notifier.dart';
import 'package:provider/provider.dart';

import '../index.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    print("HomePageState"+DemoLocalizations.of(context).home);
    return Scaffold(
      appBar: AppBar(
        title: Text("${DemoLocalizations.of(context).home}"),
      ),
      drawer: MyDrawer(),
      body: _buildBody(),
    );
  }

  _buildBody() {
    //isLogin
    UserModel userModel = Provider.of<UserModel>(context);
    if (!userModel.isLogin) {
      return Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).pushNamed("login");
          },
          child: Text("${DemoLocalizations.of(context).login}"),
        ),
      );
    } else {
      return InfiniteListView<Repo>(
        onRetrieveData: (int page, List<Repo> items, bool refresh) async {
          var data = await Git(context).getRepos(
            refresh: refresh,
            queryParameters: {
              'page': page,
              'page_size': 20,
            },
          );
          //把请求到的新数据添加到items中
          items.addAll(data);
          return data.length > 0 && data.length % 20 == 0;
        },
        itemBuilder: (List list, int index, BuildContext ctx) {
          // 项目信息列表项
          return RepoItem(list[index]);
        },
      );
    }
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          Expanded(
            child: _buildMenu(),
          )
        ],
      ),
    ));
  }
}

Widget _buildMenu() {
  return ListView(
    children: [
      Text("language"),
      Text("Theme"),
    ],
  );
}

Widget _buildHeader() {
  return Padding(
    padding: EdgeInsets.only(top: 38),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ClipOval(
            child: Image.asset(
              "assets/images/icon_no_face.png",
              width: 80,
            ),
          ),
        ),
        Text(
          "Armyone",
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}
