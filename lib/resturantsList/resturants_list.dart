import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_proj/constants.dart';
import 'package:flutter/material.dart';

// final CollectionReference restCollection =
//     FirebaseFirestore.instance.collection(kRestaurantCollection);

final _firestore = FirebaseFirestore.instance;

class ResturantsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resturants"),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection(kRestaurantCollection).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else
            return ListView(
              children: snapshot.data!.docs.map((doc) {
                return Card(
                  child: ListTile(
                    title: Text(doc.data().toString()),
                  ),
                );
              }).toList(),
            );
        },
      ),
    );
  }
}
