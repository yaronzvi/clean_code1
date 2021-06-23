import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:first_proj/search/presentation/search_page.dart';
import 'package:flutter/material.dart';

// test remark by yaron1

void main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //_bootStrapFirebase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: ImportToFirebase(),
      //home: NoteList(),
      home: SearchPage(),
    );
  }
}

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: SizedBox(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

// void _bootStrapFirebase() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();

//   //FirebaseMessaging.onBackgroundMessage(onBackgroundMessageHandler);
// }

Future<void> onBackgroundMessageHandler(RemoteMessage message) async {
  print("Handling a background message ${message.data}");
  //WidgetsFlutterBinding.ensureInitialized();

  //You need to do everything in here
  //If you need to do anything with firebase you also need to call
  //await Firebase.initializeApp();
}
