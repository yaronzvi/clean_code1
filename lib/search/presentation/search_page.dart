import 'package:first_proj/constants.dart';
import 'package:first_proj/resturantsList/resturants_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Position _currentPosition = Position(
    floor: 0,
    accuracy: 0,
    heading: 0,
    timestamp: DateTime.fromMicrosecondsSinceEpoch(0),
    speed: 0,
    longitude: 0,
    latitude: 0,
    altitude: 0,
    speedAccuracy: 0,
  );

  String? manaName;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/core/assets/bestmana_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // Align(
              //   alignment: Alignment.topLeft,
              //   child: TextButton(
              //     onPressed: () {},
              //     child: Icon(
              //       Icons.arrow_back_ios,
              //       size: 50.0,
              //     ),
              //   ),
              // ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: kTextFieldInputDecoration,
                  onChanged: (value) {
                    manaName = value;
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ResturantsList(
                          manaName: manaName,
                        );
                      },
                    ),
                  );
                },
                child: Text(
                  'Find Resturants',
                  style: kButtonTextStyle,
                ),
              ),

              Container(
                child: Text(_currentPosition.latitude.toString()),
              ),
              Container(
                child: Text(_currentPosition.longitude.toString()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getCurrentLocation() async {
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }
}
