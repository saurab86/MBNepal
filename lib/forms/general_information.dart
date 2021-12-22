import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blurry/blurry.dart';
import 'package:mbnepal/screens/home.dart';

class GeneralInformation extends CupertinoPageRoute {
 

   GeneralInformation()
      : super(builder: (BuildContext context) => new GeneralInformationForm());

  // OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return new FadeTransition(
        opacity: animation, child: new GeneralInformationForm());
  }
}

class GeneralInformationForm extends StatefulWidget {

  @override
  _GeneralInformationFormState createState() => _GeneralInformationFormState();
}

class _GeneralInformationFormState extends State<GeneralInformationForm> {

  Future<bool> _onBackpressed(){
    return backpressed();
  }
  backpressed(){
   Blurry.info(title: "Alert", 
          description: 'Are you sure you want to go back to home? Going back will not save your data in this page',
           confirmButtonText: 'Okay',
            onConfirmButtonPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomePage()));
            }).show(context);
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackpressed,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back_ios_sharp), onPressed: (){
          Blurry.info(title: "Alert", 
          description: 'Are you sure you want to go back to home? Going back will not save your data in this page',
           confirmButtonText: 'Okay',
            onConfirmButtonPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomePage()));
            }).show(context);  
          }),
          centerTitle:  true,
          title: Text("General Information",style: TextStyle(fontFamily: 'RaleWay',fontSize: 25)),
        ),
        
      ),
    );
  }
}