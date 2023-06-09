import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mathpazzle/2second.dart';
import 'package:mathpazzle/levellist.dart';
import 'package:mathpazzle/puzzlethird.dart';
import 'package:mathpazzle/winpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(home: math(), debugShowCheckedModeBanner: false));
}

class math extends StatefulWidget {
  const math({Key? key}) : super(key: key);

  @override
  State<math> createState() => _mathState();
}

class _mathState extends State<math> {
  String ff = "f1";
  bool temp = false;
  bool temp1 = false;
  bool temp2 = false;
  List puzzle_status = [];

int cur_level = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    puzzle_status=List.filled(data.ans.length, "no");
    get();
  }
  get()
  async {
    final prefs = await SharedPreferences.getInstance();
    cur_level = prefs!.getInt("curlevel") ?? 0;

    for(int i=0;i<cur_level;i++)
      {
        puzzle_status[i]=prefs!.getString("leval$i");
      }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/background.jpg"), fit: BoxFit.fill)),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        height: 100,
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "Math puzzle",
                          style: TextStyle(
                            fontFamily: ff,
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        )),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 350,
              width: 400,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                "images/blackboard_main_menu.png",
              ))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTapUp: (details) {
                      temp = false;
                      Navigator.push(context,MaterialPageRoute(builder: (context) {
                        return level(cur_level);
                      },));
                      setState(() {

                      });
                      print("onTapup");
                    },
                    onTapDown: (details) {
                      temp = true;
                      print("onTapdoen");
                      setState(() {
                      });
                      },
                    onTapCancel: () {
                      temp = false;
                      print("onTapcancel");
                      setState(() {

                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                          border:(temp)? Border.all(width: 3,
                            color: Colors.white): null,
                          ),
                      child: Text(
                        "CONTINE",
                        style: TextStyle(
                            color: Colors.white, fontFamily: ff, fontSize: 20),
                      ),
                    ),
                  ),
                  GestureDetector( onTapUp: (details) {
                    temp1 = false;
                    Navigator.push(context,MaterialPageRoute(builder: (context) {
                      return third(puzzle_status,cur_level);
                    },));
                    print("onTapup");
                  },
                    onTapDown: (details) {
                      temp1 = true;

                      setState(() {

                      });
                      print("onTapdoen");
                      setState(() {
                      });
                    },
                    onTapCancel: () {
                      temp1 = false;
                      print("onTapcancel");
                      setState(() {

                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        border:(temp1)? Border.all(width: 3,
                            color: Colors.white): null,
                      ),
                      child: Text(
                        "PUZZLES",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: ff,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(onTapUp: (details) {
                    temp2 = false;

                    print("onTapup");
                  },
                    onTapDown: (details) {
                      temp2 = true;
                      print("onTapdoen");
                      setState(() {
                        showDialog(context: context, builder: (context) {
                          return AlertDialog(
                            title: Text("""Benefits of pro version"""
                              """1.No Ads"""
                              """2. No Wait time for hint and skip"""
                              """3.Hint for every level"""
                              """4.solution for every level""",
                            ),
                            actions: [
                              TextButton(onPressed: () {},
                                  child: Text(
                                  "BUY",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                              )),
                              TextButton(onPressed: () {},
                                  child: Text(
                                    "No Thanks",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ))
                            ],
                          );
                        },);
                      });
                    },
                    onTapCancel: () {
                      temp2 = false;
                      print("onTapcancel");
                      setState(() {

                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        border:(temp2)? Border.all(width: 3,
                            color: Colors.white): null,
                      ),
                      child: Text(
                        "BUY PRO",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: ff,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/share.png"),
                      ),
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/emailus.png"),
                      ),
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),

                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [ Container(
                height: 50,
                width: 50,
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.fromLTRB(10, 0, 0, 20),
                padding: EdgeInsets.all(20),
                // decoration: BoxDecoration(
                //   image: DecorationImage(
                //     image: AssetImage("images/ltlicon.png"),
                //   ),
                //   border: Border.all(color: Colors.black),
                //   borderRadius: BorderRadius.circular(2),
                // ),
              ),
                // Container(
                //   height: 40,
                //   width: 100,
                //   alignment: Alignment.center,
                //   margin: EdgeInsets.fromLTRB(310, 0, 30, 10),
                //   decoration: BoxDecoration(
                //       border: Border.all(color: Colors.black),
                //       borderRadius: BorderRadius.circular(3)),
                //   child: Text(
                //     "Privacy Policy",
                //   ),
                // ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
