import 'package:flutter/material.dart';

import 'imagecrop.dart';

void main() {
  runApp(MaterialApp(
    home: imagepick(),
  ));
}

class mainpg extends StatefulWidget {
  const mainpg({Key? key}) : super(key: key);

  @override
  State<mainpg> createState() => _mainpgState();
}

class _mainpgState extends State<mainpg> {
  bool val = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("chip"),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            Tooltip(
              message: "user account",
              child: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            ),
            // ListWheelScrollView(diameterRatio: 2, itemExtent: 100, children: [
            //   RaisedButton(
            //     onPressed: () {},
            //     child: Text(
            //       "item 1",
            //       style: TextStyle(color: Colors.black),
            //     ),
            //   )
            // ]),
            Row(
              children: [
                Flexible(
                    flex: 1,
                    child: Container(
                      color: Colors.red,
                      height: 100,
                      width: 100,
                    )),
                SizedBox(
                  width: 100,
                ),
                Flexible(
                    flex: 1,
                    child: Container(
                      color: Colors.red,
                      height: 100,
                      width: 100,
                    ))
              ],
            ),
            Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1)),
              child: CheckboxListTile(
                title: Text("krutik"),
                activeColor: Colors.yellow,
                checkColor: Colors.black,
                subtitle: Text("93124672"),
                secondary: Icon(Icons.account_circle_rounded),
                value: val,
                onChanged: (value) {
                  setState(() {
                    val = value!;
                  });
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: InteractiveViewer(
                child: Image.asset("image/p1.jpg"),
                boundaryMargin: EdgeInsets.all(5),
              ),
            ),
            Chip(
              elevation: 10,
              shadowColor: Colors.black,
              avatar: CircleAvatar(
                child: Icon(Icons.account_circle),
                backgroundColor: Colors.yellowAccent,
              ),
              label: Text("label"),
              labelStyle: TextStyle(color: Colors.yellowAccent),
              onDeleted: () {},
              deleteIcon: Icon(Icons.close),
            ),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Helllo !"),
                    action: SnackBarAction(
                      label: "ok",
                      onPressed: () {},
                    ),
                  ));
                },
                child: Text("Submit")),
            RaisedButton(
              child: Text("Flutter"),
              onPressed: () {
                showAboutDialog(
                    context: context,
                    applicationIcon: FlutterLogo(),
                    applicationName: "Flutter",
                    applicationLegalese: "flutter@2020.com",
                    children: [Text("my name is...")]);
              },
            ),
            Card(
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.all(5), child: Text("abc")),
                  Divider(
                    thickness: 10,
                    color: Colors.yellow,
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
