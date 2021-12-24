import 'package:blurry/blurry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mbnepal/forms/general_information.dart';
import 'package:mbnepal/screens/welcome.dart';
class HomePage extends StatefulWidget {
  final  userDetails;
  const HomePage({this.userDetails});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void handleClick(String value) {
    switch (value) {
      case 'Logout':
        break;
      case 'Settings':
        break;
    }
}

 Future<bool> _onBackPressed(){
    return backpressed();
  }
  backpressed(){
   Blurry.warning(title: 'Alert', 
   description: 'Do you really want to exit ?', confirmButtonText: 'Yes', onConfirmButtonPressed: ()=>SystemNavigator.pop()).show(context);
  }
  @override
  Widget build(BuildContext context) {

    // ignore: unused_local_variable
    final Map<String, String> userDetails = widget.userDetails;

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light, // For Android (dark icons)
          ),
          backgroundColor: Color.fromRGBO(13, 54, 146,1),
          centerTitle: true,
          // title: Text(userDetails.toString()),
          leading: IconButton(icon: Icon(Icons.menu),onPressed: (){},),
          title: Text("Credit Appraisal",style: TextStyle(fontFamily: 'Raleway',fontSize: 18,letterSpacing: 1,fontWeight: FontWeight.w700),),
          actions: [
             PopupMenuButton<String>(
              onSelected: handleClick,
              itemBuilder: (BuildContext context) {
                return {'Logout', 'Export', 'Change PIN'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice,style: TextStyle(fontFamily: 'Raleway')),
                  );
                }).toList();
              })],
        ),
        body:SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>WelcomeScreen()));
              }, child: Text("TextButton"))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          Navigator.of(context).push(GeneralInformation());
        },
        backgroundColor: Color.fromRGBO(13, 54, 146,1),
        tooltip: "You have clicked",
        child: Icon(Icons.add),), 
      ),
    );
  }
}