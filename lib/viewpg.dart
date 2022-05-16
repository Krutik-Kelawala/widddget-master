import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class imageview extends StatefulWidget {
  @override
  State<imageview> createState() => _imageviewState();
}

class _imageviewState extends State<imageview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hero pg 2"),
      ),
      body: SafeArea(
        child: Hero(
            tag: "Profile",
            child: Container(
              child: Icon(
                Icons.person,
                size: 100,
              ),
              width: double.infinity,
              height: 300,
              alignment: Alignment.topLeft,
            )),
      ),
    );
  }
}
