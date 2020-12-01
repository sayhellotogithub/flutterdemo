import 'package:flutter/material.dart';

class StreamBuilderLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StreamBuilder Demo"),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: counter(),
          builder: (context, snapshot) {
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text('没有Stream');
              case ConnectionState.waiting:
                return Text('等待数据...');
              case ConnectionState.active:
                return Text('active: ${snapshot.data}');
              case ConnectionState.done:
                return Text('Stream已关闭');
            }
            return null; // unreachable
          },
        ),
      ),
    );
  }

  Stream<int> counter() {
    return Stream.periodic(Duration(seconds: 1), (i) => i);
  }
}
