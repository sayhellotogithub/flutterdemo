import 'package:flutter/material.dart';
import 'package:flutterdemo/l10n/messages_all.dart';
import 'package:intl/intl.dart';

class InternationLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(DemoLocalizations.of(context).title),
      ),
      body: Center(
        child: Column(
          children: [Text("${DemoLocalizations.of(context).home}")],
        ),
      ),
    );
  }
}

class DemoLocalizations {
  DemoLocalizations(this.localeName);

  static Future<DemoLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    print(localeName);
    return initializeMessages(localeName).then((_) {
      return DemoLocalizations(localeName);
    });
  }

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

  final String localeName;

  String get title {
    return Intl.message(
      'Hello Worldmessage',
      name: 'title',
      desc: 'Title for the Demo application',
      locale: localeName,
    );
  }

  String get AppName {
    return Intl.message("", name: "appName", desc: "", locale: localeName);
  }

  String get home {
    return Intl.message("", name: "home", locale: localeName);
  }

  String get login {
    return Intl.message("", name: "login", locale: localeName);
  }

  String get noDescription {
    return Intl.message("", name: "noDescription", locale: localeName);
  }
}

class DemoLocalizationsDelegate
    extends LocalizationsDelegate<DemoLocalizations> {
  const DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'es', 'zh'].contains(locale.languageCode);

  @override
  Future<DemoLocalizations> load(Locale locale) =>
      DemoLocalizations.load(locale);

  @override
  bool shouldReload(DemoLocalizationsDelegate old) => false;
}
