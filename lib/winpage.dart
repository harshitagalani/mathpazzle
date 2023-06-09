import 'package:flutter/material.dart';
import 'package:mathpazzle/2second.dart';
import 'package:mathpazzle/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class win extends StatefulWidget {
  int cur_level;
   win(this.cur_level);

  @override
  State<win> createState() => _winState();
}

class _winState extends State<win> {
  String ff = "f1";
  int cur_level = 0;
  SharedPreferences ? prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    get();
  }
  get()
  async {
    final prefs = await SharedPreferences.getInstance();
    cur_level = prefs!.getInt("curlevel") ?? 0;
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("images/background.jpg"),
            fit: BoxFit.cover,
          )),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    alignment: Alignment.center,
                    child: Text(
                      "puzzle ${widget.cur_level} completed",
                      style: TextStyle(
                          fontFamily: ff,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Container(
                height: 150,
                width: 200,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/trophy.png"))),
                alignment: Alignment.bottomCenter,
              ),
              InkWell(onTap: () {
                if (widget.cur_level < widget.cur_level - 1)
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return level(cur_level);
                  },));
                }
                else
                {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                return level(cur_level );
                },));
                }
              },
                child: Container(
                  height: 30,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8)),
                  alignment: Alignment.center,
                  child: Text(
                    "CONTINUE",
                    style: TextStyle(
                      fontFamily: ff,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              InkWell(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return math();
                },));
              },
                child: Container(
                  height: 30,
                  width: 120,
                  decoration:
                      BoxDecoration(
                        color: Colors.grey,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8)),
                  alignment: Alignment.center,
                  child: Text(
                    "MAIN MENU",
                    style: TextStyle(
                      fontFamily: ff,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Container(
                height: 30,
                width: 120,
                decoration:
                    BoxDecoration(
                      color: Colors.grey,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(8)),
                alignment: Alignment.center,
                child: Text(
                  "BUY PRO",
                  style: TextStyle(
                    fontFamily: ff,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                height: 100,
                alignment: Alignment.center,
                child: Text(
                  "SHARE THIS PUZZLE",
                  style: TextStyle(
                    fontFamily: ff,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.indigo,
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/share.png"),
                  ),
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ],
          )),
    );
  }
}
