import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

void main() {
  runApp(MaterialApp(home: on()));
}

class on extends StatefulWidget {
  @override
  _onState createState() => _onState();
}

class _onState extends State<on> {
  PageController pageController =
      PageController(initialPage: 0, keepPage: false);
  int index = 0;
  List<String> titles = ["learn", "build", "enjoy"];
  List<String> pics = ["images/pc1.png", "images/pc2.png", "images/pc3.png"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            onPageChanged: (pos) {
              setState(() {
                index = pos;
              });
            },
            controller: pageController,
            itemCount: titles.length,
            itemBuilder: (context, position) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Image(
                          image: AssetImage(
                            "${pics[position]}",
                          ),
                        ),
                        width: 400,
                        height: 300,
                      ),
                      Text(
                        "${titles[position]}",
                        style: TextStyle(fontSize: 28),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Learn the code",
                        overflow: TextOverflow.visible,
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                dot(index, 0),
                SizedBox(
                  width: 10,
                ),
                dot(index, 1),
                SizedBox(
                  width: 10,
                ),
                dot(index, 2),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                  child: Text("skip"),
                  onPressed: () {},
                ),
                FlatButton(
                  child: Text("next"),
                  onPressed: () {
                    pageController.nextPage(
                        duration: Duration(microseconds: 300),
                        curve: Curves.linear);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

dot(index, i) {
  return Container(
    width: 10,
    height: 10,
    decoration: BoxDecoration(
      //  color: Colors.grey,
      color: index == i ? Colors.green : Colors.grey,
      borderRadius: BorderRadius.circular(5),
    ),
  );
}
