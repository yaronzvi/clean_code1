import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_proj/constants.dart';
import 'package:first_proj/data/model/restaurant/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        // temporary stop using name
        //.where('name', isGreaterThanOrEqualTo: widget.manaName)
        //.where('name', isLessThan: widget.manaName + 'z')
        //.orderBy('name')
        .limit(10);

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
                  child: Column(
                    children: [
                      Padding(padding: const EdgeInsets.all(8.0)),
                      ListTile(
                        leading: FlutterLogo(size: 72.0),
                        title: Text(
                          doc['name'].toString(),
                          style: TextStyle(fontSize: 16.0),
                        ),
                        subtitle: Text(
                          doc['address'].toString(),
                          style: TextStyle(fontSize: 16.0),
                        ),
                        trailing: Icon(Icons.more_vert),
                      ),
                      Padding(padding: const EdgeInsets.all(8.0)),
                    ],
                  ),
                );
              }).toList(),
            );
        },
      ),
    );
  }
}
