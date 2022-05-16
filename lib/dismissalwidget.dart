import 'package:flutter/material.dart';

class dismmissal extends StatefulWidget {
  @override
  State<dismmissal> createState() => _dismmissalState();
}

class _dismmissalState extends State<dismmissal> {
  List<String> itemlist = ["1", "2", "3", "4", "5"];

  List<String> listItems = [
    "One",
    "Two",
    "Three",
    "Four"
  ]; //dummy list of items

  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        //   appBar: AppBar(
        //     title: Text("Swipe List"),
        //   ),
        //   body: Container(
        //     alignment: Alignment.center,
        //     height: 100,
        //     child: ListView.separated(
        //         scrollDirection: Axis.horizontal,
        //         itemCount: listItems.length,
        //         padding: const EdgeInsets.all(5.0),
        //         separatorBuilder: (context, index) => VerticalDivider(
        //               color: Colors.black,
        //             ),
        //         itemBuilder: (context, index) {
        //           return Dismissible(
        //             direction: DismissDirection.vertical,
        //             key: Key('item ${listItems[index]}'),
        //             background: Container(
        //               color: Colors.blue,
        //               child: Padding(
        //                 padding: const EdgeInsets.all(15),
        //                 child: Icon(Icons.favorite, color: Colors.white),
        //               ),
        //             ),
        //             secondaryBackground: Container(
        //               color: Colors.red,
        //               child: Padding(
        //                 padding: const EdgeInsets.all(15),
        //                 child: Icon(Icons.delete, color: Colors.white),
        //               ),
        //             ),
        //             onDismissed: (DismissDirection direction) {
        //               if (direction == DismissDirection.down) {
        //                 print("Add to favorite");
        //               } else {
        //                 print('Remove item');
        //               }
        //
        //               setState(() {
        //                 listItems.removeAt(index);
        //               });
        //             },
        //             child: Container(
        //               width: 100,
        //               child: Center(
        //                 child: Column(
        //                   children: [
        //                     Icon(Icons.phone_android, size: 50),
        //                     Text(listItems[index]),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           );
        //         }),
        //   ));
        // );
        // }
// }
        Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: itemlist.length,
          itemBuilder: (context, index) {
            return Dismissible(
              background: stackBehindDismiss(),
              secondaryBackground: secondarystackBehindDismiss(),
              key: ObjectKey(itemlist[index]),
              child: Container(
                padding: EdgeInsets.all(20),
                child: Text("${itemlist[index]}"),
              ),
              onDismissed: (direction) {
                if (direction == DismissDirection.startToEnd) {
                  print("Add to favourite");
                } else {
                  print("Remove item");
                  deleteite(index);
                }
              },
              confirmDismiss: (direction) {
                return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Confirm"),
                      content: direction == DismissDirection.startToEnd
                          ? Text(
                              "Are you sure you wish add to favorite this item?")
                          : Text("Are you sure you wish to delete this item?"),
                      actions: [
                        FlatButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: direction == DismissDirection.startToEnd
                              ? Text("FAVORITE")
                              : Text("DELETE"),
                        ),
                        FlatButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text("CANCEL"),
                        ),
                      ],
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  void deleteite(int index) {
    setState(() {
      itemlist.removeAt(index);
    });
  }

  stackBehindDismiss() {
    return Container(
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Icon(Icons.favorite, color: Colors.white),
            Text('Move to favorites', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }

  secondarystackBehindDismiss() {
    return Container(
      color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.delete, color: Colors.white),
            Text('Move to trash', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
