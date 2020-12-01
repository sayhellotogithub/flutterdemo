import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterdemo/page/word_list.dart';
import 'package:flutterdemo/route/tip_route.dart';
import 'package:flutterdemo/text/text_default_style.dart';

import 'animation/animation_list_layout.dart';
import 'layout/align_layout.dart';
import 'layout/container_layout.dart';
import 'layout/customscrollview_layout.dart';
import 'layout/decoration_layout.dart';
import 'layout/dialog_layout.dart';
import 'layout/dialog_state_layout.dart';
import 'layout/flex_a.dart';
import 'layout/flow_layout.dart';
import 'layout/future_builder_layout.dart';
import 'list/infinite_gridview.dart';
import 'list/infinite_listview.dart';
import 'layout/inheritedwidget_layout.dart';
import 'list/list_layout.dart';
import 'layout/scaff_layout.dart';
import 'layout/scrollcontroller_layout.dart';
import 'layout/scrollnotification_layout.dart';
import 'layout/singlechildscrollview_layout.dart';
import 'layout/stack_position_layout.dart';
import 'layout/stream_builder_layout.dart';
import 'layout/willpopscope_layout.dart';
import 'layout/wrap_layout.dart';
import 'listener/gesture_change_color_layout.dart';
import 'listener/gesture_layout.dart';
import 'listener/notification_layout.dart';
import 'provider/cart_provider.dart';
import 'state/tapbox_a.dart';
import 'state/tapbox_b.dart';
import 'state/tapbox_c.dart';
import 'text/box_a.dart';
import 'text/button_a.dart';
import 'text/image_a.dart';
import 'text/text_font_family.dart';
import 'text/text_input_a.dart';
import 'text/text_span.dart';
import 'three/form_a.dart';
import 'three/progress_indicator.dart';
import 'three/progress_indicator_animation.dart';
import 'three/text_input_decoration.dart';

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

class _MyHomePageState extends State<MyHomePage> {
  var routeList = List<String>();

  @override
  void initState() {
    routeList.add("animation set");
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
    if (index == 0) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return AnimationListLayout();
      }));
    }
  }
}
