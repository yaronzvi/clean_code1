import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_proj/add_resturantF/core/read_json_file.dart';
import 'package:first_proj/constants.dart';
import 'package:first_proj/data/model/restaurant/restaurant.dart';
import 'package:flutter/material.dart';

final _firestore = FirebaseFirestore.instance;

class ImportToFirebase extends StatefulWidget {
  const ImportToFirebase({Key? key}) : super(key: key);

  @override
  _ImportToFirebaseState createState() => _ImportToFirebaseState();
}

class _ImportToFirebaseState extends State<ImportToFirebase> {
  // void _sendMessage() {
  //   final _newRest = Restaurant(
  //     id: "3000",
  //     name: "Paul",
  //     address: "hamari 45",
  //     description: "aaa",
  //     city: "givattaim",
  //     remarks: "none",
  //   ).toJson();
  //   _firestore.collection(kRestaurantCollection).add(_newRest);
  // }

  void _sendMessageLoop() async {
    final _newRestList = await loadJsonData();
    for (var i = 0; i < _newRestList.length; i++) {
      print(_newRestList[i]);
      _firestore.collection(kRestaurantCollection).add(_newRestList[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Text("data"),
            ),
            IconButton(
              color: Theme.of(context).primaryColor,
              onPressed: () {
                _sendMessageLoop();
                print('json was sent..');
              },
              icon: Icon(Icons.send),
            ),
          ],
        ),
      ),
    );
  }
}
