import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = MessageLookup();

final _keepAnalysisHappy = Intl.defaultLocale;

typedef MessageIfAbsent(String message_str, List args);

class MessageLookup extends MessageLookupByLibrary {
  get localeName => 'zh';

  final messages = _notInlinedMessages(_notInlinedMessages);

  static _notInlinedMessages(_) => {
        "title": MessageLookupByLibrary.simpleMessage("你好"),
        "home": MessageLookupByLibrary.simpleMessage("iblogstreet flutter 主页"),
        "login": MessageLookupByLibrary.simpleMessage("登录")
      };
}
