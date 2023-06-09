import 'package:flutter/material.dart';

class user extends StatefulWidget {
  int cur_level;
  List puzzle_status;
  user(this.cur_level,this.puzzle_status);

  @override
  State<user> createState() => _userState();
}

class _userState extends State<user> {
  String ff = "f1";
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    "Select Puzzle",
                    style: TextStyle(
                      fontFamily: ff,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: GridView.builder(itemCount: 20,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    child: (index < widget.cur_level)
                        ? Text("${index+1}",
                      style: TextStyle(fontSize: 25),
                    )
                        :null,
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      image: (index <widget.cur_level)
                          ? (widget.puzzle_status[index] == "win")
                          ? DecorationImage(
                          image: AssetImage(
                            "images/tick.png",
                          ))
                          :null
                          : DecorationImage(image:AssetImage("images/lock.png")),
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    )
    );
  }
}
