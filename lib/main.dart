import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mbnepal/screens/login.dart';

String idToken;

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    // systemNavigationBarColor: Colors.blue, // navigation bar color
    statusBarColor: Colors.white60, // status bar color
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
      theme: Theme.of(context).copyWith(appBarTheme: Theme.of(context).appBarTheme.copyWith(brightness: Brightness.light))
      // ThemeData(fontFamily: "RaleWay"),

    );
  }
}
