import 'package:flutter/material.dart';

class FutureBuilderLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FutureBuilder Demo"),
      ),
      body: Center(
        child: FutureBuilder(
          future: mockData(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.done) {
              if (snap.hasError) {
                return Text("Error${snap.hasError}");
              }
              return Text("Success${snap.data}");
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Future<String> mockData() async {
    return Future.delayed(Duration(seconds: 2), () => "data from network");
  }
}
