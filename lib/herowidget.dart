import 'package:flutter/material.dart';
import 'package:widddget/dismissalwidget.dart';
import 'package:widddget/viewpg.dart';

class herowidgett extends StatefulWidget {
  @override
  State<herowidgett> createState() => _herowidgettState();
}

class _herowidgettState extends State<herowidgett> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hero pg 1"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return imageview();
                    },
                  ));
                },
                child: Hero(
                    tag: "Profile",
                    child: Icon(
                      Icons.edit,
                      size: 100,
                    )),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return dismmissal();
                    },
                  ));
                },
                child: Text("Next"))
          ],
        ),
      ),
    );
  }
}
