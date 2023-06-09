import 'package:flutter/material.dart';

class data {}

class math extends StatefulWidget {
  const math({Key? key}) : super(key: key);

  @override
  State<math> createState() => _mathState();
}

class _mathState extends State<math> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("imagea/gameplaybackground.jpg"),
                fit: BoxFit.fill)),
        height: 1000,
        width: double.infinity,
        child: Column(children: [
          Container(
            margin: EdgeInsets.all(5),
            height: 50,
            width: 50,
            child: Text(""),
          )
        ],),

              ),);

  }
}
