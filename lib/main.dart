import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterdemo/route/tip_route.dart';

import 'animation/animation_list_layout.dart';
import 'fileornet/file_or_net_list_layout.dart';
import 'view/view_list_layout.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    //reportError(details);
  };
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    debugPaintLayerBordersEnabled = true;
//    debugPaintBaselinesEnabled = true;
    localizationsDelegates: [
      // 本地化的代理类
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    return MaterialApp(
      title: "flutter demo",
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(title: "Home"),
        "tip_route": (context) =>
            TipRoute(text: ModalRoute.of(context).settings.arguments)
      },
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          String routeName = settings.name;
        });
      },
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

const VIEW_LIST_LAYOUT = "ViewList";
const ANIMATION_SET = "AnimationSet";
const FILE_LIST = "FileList";

class _MyHomePageState extends State<MyHomePage> {
  var routeList = List<String>();

  @override
  void initState() {
    routeList.add(ANIMATION_SET);
    routeList.add(VIEW_LIST_LAYOUT);
    routeList.add(FILE_LIST);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("${routeList[index]}"),
              onTap: () {
                handleTap(index);
              },
            );
          },
          itemCount: routeList.length,
        ),
      ),
    );
  }

  void handleTap(int index) {
    if (routeList[index].startsWith(ANIMATION_SET)) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return AnimationListLayout();
      }));
    } else if (routeList[index].startsWith(VIEW_LIST_LAYOUT)) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ViewListLayout();
      }));
    } else if (routeList[index].startsWith(FILE_LIST)) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return FileOrNetListLayout();
      }));
    }
  }
}
