import 'package:flutter/material.dart';
import 'package:mbnepal/screens/login.dart';

String idToken;

void main(){
   WidgetsFlutterBinding.ensureInitialized();
   WidgetsFlutterBinding.ensureInitialized();
  runApp(MbNepalApp());
}

class MbNepalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MB Nepal',
      debugShowCheckedModeBanner: false,
      home: Login(),
      theme: ThemeData(fontFamily: "RaleWay"),
    );
  }
}
