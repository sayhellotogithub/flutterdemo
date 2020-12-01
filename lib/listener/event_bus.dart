typedef void EventCallBack(arg);

class EventBus {
  EventBus._internal();

  static EventBus _singleton = EventBus._internal();

  var _eventMap = Map<Object, List<EventCallBack>>();

  factory EventBus() => _singleton;

  void on(eventName, [EventCallBack callBack]) {
    if (eventName == null || callBack == null) return;
    _eventMap[eventName] ??= List<EventCallBack>();

    _eventMap[eventName].add(callBack);
  }

  void off(eventName, [EventCallBack callBack]) {
    var list = _eventMap[eventName];
    if (eventName == null || list == null) return;

    if (callBack == null) {
      _eventMap[eventName] = null;
    } else {
      list.remove(callBack);
    }
  }

  void emit(eventName, [arg]) {
    var list = _eventMap[eventName];
    int len = list.length - 1;
    for (var i = len; i > -1; i--) {
      list[i](arg);
    }
  }
}

var bus = EventBus();
