import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 22,
          ),
          Row(
            children: [Text("Hello, Human !")],
          )
        ],
      )),
    );
  }
}
