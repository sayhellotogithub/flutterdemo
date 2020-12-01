class SingleDemo {
  SingleDemo._internal();

  static SingleDemo _singleton = SingleDemo._internal();

  factory SingleDemo() => _singleton;
}

