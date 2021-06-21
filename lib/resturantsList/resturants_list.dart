import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_proj/constants.dart';
import 'package:flutter/material.dart';

// final CollectionReference restCollection =
//     FirebaseFirestore.instance.collection(kRestaurantCollection);

class ResturantsList extends StatefulWidget {
  final manaName;
  ResturantsList({required this.manaName});

  @override
  _ResturantsListState createState() => _ResturantsListState();
}

class _ResturantsListState extends State<ResturantsList> {
  @override
  Widget build(BuildContext context) {
    final _firestore = FirebaseFirestore.instance
        .collection(kRestaurantCollection)
        .where('name', isGreaterThanOrEqualTo: widget.manaName)
        .where('name', isLessThan: widget.manaName + 'z');

    return Scaffold(
      appBar: AppBar(
        title: Text("Resturants"),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.snapshots(),
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
