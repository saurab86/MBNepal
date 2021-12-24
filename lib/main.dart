import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mbnepal/screens/login.dart';

String idToken;

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
     systemNavigationBarColor: Colors.blue, // navigation bar color
    statusBarColor:  Color.fromRGBO(13, 54, 146,1),
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark

     // status bar color
  ));

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
       theme: ThemeData(
        appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
        ),
      ),
      // ThemeData(fontFamily: "RaleWay"),

    );
  }
}
