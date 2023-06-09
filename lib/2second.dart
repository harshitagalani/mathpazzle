import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mathpazzle/levellist.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mathpazzle/main.dart';
import 'package:mathpazzle/winpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class level extends StatefulWidget {
  int cur_level;

  level(this.cur_level);

  @override
  State<level> createState() => _levelState();
}

class _levelState extends State<level> {
  String ans = "";
  int cur_leavel = 0;
  SharedPreferences? pref;

  Widget my_btn(int a) {
    return Expanded(
      child: InkWell(
        onTap: () {
          ans = ans + a.toString();
          setState(() {});
        },
        child: Container(
          alignment: Alignment.center,
          height: 20,
          width: 35,
          margin: EdgeInsets.all(5),
          child: Text(
            "$a",
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
          decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(5)),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (cur_leavel > data.game_level.length) {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return win(cur_leavel);
        },
      ));
    } else {
      pref?.clear();
    }

    cur_leavel = widget.cur_level;
    get();
  }

  get() async {
    pref = await SharedPreferences.getInstance();
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: Container(
          height: double.infinity,width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/gameplaybackground.jpg"),
                fit: BoxFit.fill),
          ),
          //height: 1000,
          //width: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(onTap: () async {
                        if (pref!.getInt("Time") == 1) {
                          int second;
                          DateTime t2 = DateTime.now();

                          Duration diff = t2.difference(
                              DateTime.parse(pref!.getString("Date") ?? ""));
                          second = 30 - diff.inSeconds;

                          showDialog(
                            context: context,
                            builder: (context) {
                              return (diff.inSeconds > 30)
                                  ? AlertDialog(
                                title: Text(
                                  "Skip",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                buttonPadding: EdgeInsets.only(left: 30),
                                content: Text(
                                    "Are you sure you want to skip this level ?"),
                                actions: [
                                  TextButton(
                                      onPressed: () async {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Cancel",
                                        style:
                                        TextStyle(color: Colors.pink),
                                      )),
                                  TextButton(
                                      onPressed: () async {
                                        SharedPreferences pref =
                                        await SharedPreferences
                                            .getInstance();

                                        DateTime t1 = DateTime.now();
                                        pref.setString(
                                            "Date", t1.toString());
                                        cur_leavel++;
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return level(cur_leavel);
                                              },
                                            ));
                                        setState(() {});
                                      },
                                      child: Text(
                                        "Ok",
                                        style:
                                        TextStyle(color: Colors.pink),
                                      )),
                                ],
                              )
                                  : AlertDialog(
                                title: Text("Wait"),
                                content:
                                Text("Wait For ${second} Second"),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Ok"))
                                ],
                              );
                            },
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                  "Skip",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                buttonPadding: EdgeInsets.only(left: 30),
                                content: Text(
                                    "Are you sure you want to skip this level?"),
                                actions: [
                                  TextButton(
                                      onPressed: () async {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Cancel",
                                        style: TextStyle(color: Colors.pink),
                                      )),
                                  TextButton(
                                      onPressed: () async {
                                        DateTime t1 = DateTime.now();
                                        pref!.setString("Date", t1.toString());
                                        cur_leavel++;
                                        pref!.setInt("Time", 1);
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return level(cur_leavel);
                                              },
                                            ));
                                        setState(() {});
                                      },
                                      child: Text(
                                        "Ok",
                                        style: TextStyle(color: Colors.pink),
                                      )),
                                ],
                              );
                            },
                          );
                        }
                      },child:   Container(
                        // margin: EdgeInsets.only(top: 50, left: 20),
                        height: 80,
                        child: Text("1"),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/skip.png"))),
                      )),
                    ),
                    Expanded(
                      child: Container(
                        child: Text(
                          "puzzle ${cur_leavel + 1}",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily: "f1"),
                        ),
                        //margin: EdgeInsets.only(top: 50, left: 10, right: 10),
                        height: 70,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage("images/level_board.png"),
                        )),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.topRight,
                        height: 80,

                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/hint.png")),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(flex: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 250,
                      width: 250,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image:
                            AssetImage("images/${data.game_level[cur_leavel]}"),
                      )),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Expanded(flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                  
                        color: Colors.black,
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Container(
                                    child: Text("$ans"),
                                    height: 30,
                                    width: 150,
                                    margin: EdgeInsets.all(8),
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      if (ans.length > 0) {
                                        ans = ans.substring(0, ans.length - 1);
                                      }
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image:
                                                AssetImage("images/delete.png")),
                                        border: Border.all(color: Colors.white38),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      if (ans == data.ans[cur_leavel]) {
                                        pref!
                                            .setString("leval$cur_leavel", "win");
                                        if(cur_leavel<data.ans.length-1){
                                          cur_leavel++;
                                       int t =   pref!.getInt("curlevel")??0;
                                       if(cur_leavel>t){
                                         pref!.setInt("curlevel", cur_leavel);
                                       }
                                        }
                                        ans = "";
                                        Navigator.push(context, MaterialPageRoute(
                                          builder: (context) {
                                            return win(cur_leavel);
                                          },
                                        ));
                                      } else {
                                        Fluttertoast.showToast(
                                            msg: "wrong ans",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      }
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 100,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "SUBMIT",
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  my_btn(1),
                                  my_btn(2),
                                  my_btn(3),
                                  my_btn(4),
                                  my_btn(5),
                                  my_btn(6),
                                  my_btn(7),
                                  my_btn(8),
                                  my_btn(9),
                                  my_btn(0),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("are you for exit"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return math();
                        },
                      ));
                    },
                    child: Text("yes")),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("no")),
              ],
            );
          },
        );
        return true;
      },
    );
  }
}
