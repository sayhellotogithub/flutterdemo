import 'package:flutter/material.dart';

class AnimatedDecoratedBoxLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnimatedDecoratedBoxLayoutState();
  }
}

class AnimatedDecoratedBoxLayoutState
    extends State<AnimatedDecoratedBoxLayout> {
  Color _decorationColor = Colors.blue;
  Color _color = Colors.green;
  var duration = Duration(milliseconds: 500);
  var duration_one = Duration(seconds: 1);

  var _padding = 10.0;
  var _left = 0.0;
  var _align = Alignment.center;

  var _height = 100.0;
  var _colorA = Colors.red;

  TextStyle _style = TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("AnimatedDecoratedBox"),
        ),
        body: Center(
          child: Column(
            children: [
              AnimatedDecoratedBoxImp(
                duration: Duration(milliseconds: 400),
                decoration: BoxDecoration(color: _decorationColor),
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      _decorationColor = _decorationColor == Colors.blue
                          ? Colors.red
                          : Colors.blue;
                    });
                  },
                  child: Text(
                    "AnimatedDecoratedBox",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              AnimatedDecoratedBox(
                duration: duration_one,
                decoration: BoxDecoration(color: _color),
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      _color = Colors.red;
                    });
                  },
                  child: Text(
                    "AnimatedDecoratedBox",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    _padding = 20;
                  });
                },
                child: AnimatedPadding(
                  duration: Duration(seconds: 5),
                  padding: EdgeInsets.all(_padding),
                  child: Text("AnimatedPadding"),
                ),
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: Stack(
                  children: [
                    AnimatedPositioned(
                        left: _left,
                        child: RaisedButton(
                          onPressed: () {
                            setState(() {
                              _left = 100;
                            });
                          },
                          child: Text("AnimatedPositioned"),
                        ),
                        duration: Duration(seconds: 5))
                  ],
                ),
              ),
              Container(
                height: 100,
                color: Colors.grey,
                child: AnimatedAlign(
                  duration: Duration(seconds: 5),
                  alignment: _align,
                  child: RaisedButton(
                    child: Text("AnimatedAlign"),
                    onPressed: () {
                      setState(() {
                        _align = Alignment.centerLeft;
                      });
                    },
                  ),
                ),
              ),
              AnimatedContainer(
                duration: Duration(seconds: 5),
                color: _colorA,
                height: _height,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      _height = 150.0;
                      _colorA = Colors.green;
                    });
                  },
                  child: Text("AnimatedContainer"),
                ),
              ),
              AnimatedDefaultTextStyle(
                style: _style,
                duration: Duration(seconds: 3),
                child: GestureDetector(
                  child: Text("AnimatedDefaultTextStyle"),
                  onTap: () {
                    _style = TextStyle(
                        color: Colors.blue,
                        decorationColor: Colors.black,
                        decorationStyle: TextDecorationStyle.solid);
                  },
                ),
              ),
            ],
          ),
        ));
  }
}

class AnimatedDecoratedBox extends StatefulWidget {
  AnimatedDecoratedBox(
      {Key key,
      @required this.decoration,
      this.child,
      this.curve,
      @required this.duration});

  final BoxDecoration decoration;
  final Widget child;
  final Duration duration;
  final Curve curve;

  @override
  State<StatefulWidget> createState() {
    return AnimatedDecoratedBoxState();
  }
}

class AnimatedDecoratedBoxState extends State<AnimatedDecoratedBox>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  DecorationTween _tween;

  @override
  void initState() {
    _controller = AnimationController(duration: widget.duration, vsync: this);
    _tween = DecorationTween(begin: widget.decoration);
    _updateCurve();
    super.initState();
  }

  void _updateCurve() {
    if (widget.curve != null) {
      _animation = CurvedAnimation(parent: _controller, curve: widget.curve);
    } else {
      _animation = _controller;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return DecoratedBox(
          decoration: _tween.animate(_animation).value,
          child: child,
        );
      },
      child: widget.child,
    );
  }

  @override
  void didUpdateWidget(covariant AnimatedDecoratedBox oldWidget) {
    if (widget.curve != oldWidget.curve) {
      _updateCurve();
    }

    _controller.duration = widget.duration;
    if (widget.decoration != (_tween.end ?? _tween.begin)) {
      _tween
        ..begin = _tween.evaluate(_animation)
        ..end = widget.decoration;
      _controller
        ..value = 0.0
        ..forward();
    }
    super.didUpdateWidget(oldWidget);
  }
}

class AnimatedDecoratedBoxImp extends ImplicitlyAnimatedWidget {
  AnimatedDecoratedBoxImp(
      {Key key,
      @required this.decoration,
      this.child,
      Curve curve = Curves.linear,
      @required Duration duration})
      : super(key: key, curve: curve, duration: duration);

  final BoxDecoration decoration;
  final Widget child;

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() {
    return AnimatedDecoratedBoxImpState();
  }
}

class AnimatedDecoratedBoxImpState
    extends AnimatedWidgetBaseState<AnimatedDecoratedBoxImp> {
  DecorationTween _decorationTween;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: _decorationTween.evaluate(animation),
      child: widget.child,
    );
  }

  @override
  void forEachTween(visitor) {
    _decorationTween = visitor(_decorationTween, widget.decoration, (value) {
      return DecorationTween(begin: value);
    });
  }
}
