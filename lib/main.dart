import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterdemo/index.dart';
import 'package:flutterdemo/page/home_page.dart';
import 'package:flutterdemo/page/language_set_page.dart';
import 'package:flutterdemo/page/login_page.dart';
import 'package:flutterdemo/page/theme_change_page.dart';
import 'package:flutterdemo/route/tip_route.dart';
import 'package:provider/provider.dart';

import 'animation/animation_list_layout.dart';
import 'common/global.dart';
import 'fileornet/file_or_net_list_layout.dart';
import 'internation/demo_localization.dart';
import 'state/profile_change_notifier.dart';
import 'view/view_list_layout.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    //reportError(details);
  };
  Global.init().then((e) => runApp(GithubApp()));
}

class GithubApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ThemeModel()),
        ChangeNotifierProvider.value(value: UserModel()),
        ChangeNotifierProvider.value(value: LocaleModel()),
      ],
      child: Consumer2<ThemeModel, LocaleModel>(
        builder: (context, themeModel, localModel, child) {
          return MaterialApp(
            theme: ThemeData(primarySwatch: themeModel.theme),
            onGenerateTitle: (context) => DemoLocalizations.of(context).AppName,
            home: HomePage(),
            supportedLocales: [
              const Locale("en", "US"),
              const Locale("zh", "CN")
            ],
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              const DemoLocalizationsDelegate(),
            ],
            locale: localModel.getLocale(),
            localeResolutionCallback:
                (Locale _locale, Iterable<Locale> supportedLocales) {
              if (localModel.getLocale() != null) {
                //如果已经选定语言，则不跟随系统
                return localModel.getLocale();
              } else {
                Locale locale;
                //APP语言跟随系统语言，如果系统语言不是中文简体或美国英语，
                //则默认使用美国英语
                print("localeResolutionCallback${_locale.toString()}");
                if (supportedLocales.contains(_locale)) {
                  locale = _locale;
                } else {
                  locale = Locale('en', 'US');
                }
                return locale;
              }
            },
            routes: {
              "login": (context) => LoginPage(),
              "themes": (context) => ThemeChangePage(),
              "language": (context) => LanguageSetPage()
            },
          );
        },
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    debugPaintLayerBordersEnabled = true;
//    debugPaintBaselinesEnabled = true;

    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        const DemoLocalizationsDelegate(),
      ],
      supportedLocales: [const Locale("en", "US"), const Locale("zh", "CN")],
      onGenerateTitle: (context) {
        return DemoLocalizations.of(context).AppName;
      },
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
const INTERNATION_LAYOUT = "InternationLayout";

class _MyHomePageState extends State<MyHomePage> {
  var routeList = List<String>();

  @override
  void initState() {
    routeList.add(ANIMATION_SET);
    routeList.add(VIEW_LIST_LAYOUT);
    routeList.add(FILE_LIST);
    routeList.add(INTERNATION_LAYOUT);

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
    } else if (routeList[index].startsWith(INTERNATION_LAYOUT)) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return InternationLayout();
      }));
    }
  }
}
