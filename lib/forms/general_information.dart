import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blurry/blurry.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        body: SingleChildScrollView(
          child: Form(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(left: 23,right: 23,top: 35),
              child: Text('Appraisal Number :',style: TextStyle(fontFamily: 'Raleway',fontSize: 16,fontWeight: FontWeight.w500,color: Color.fromRGBO(9, 44, 76, 1)))),
              
              Padding(padding: EdgeInsets.only(left: 23,right: 23,top: 8),
              child: Text('00000200000122122021000002',style: TextStyle(fontFamily: 'Raleway',fontSize: 17,fontWeight: FontWeight.w500))),
              
              Padding(padding: EdgeInsets.only(left: 23,right: 23,top: 8),
              child: Divider(thickness: 1,),),
              
              Padding(padding: EdgeInsets.only(left: 23,right: 23,top: 8),
              child: Text('CO Name :',style: TextStyle(fontFamily: 'Raleway',fontSize: 16,fontWeight: FontWeight.w500,color: Color.fromRGBO(9, 44, 76, 1)))),

              Padding(padding: EdgeInsets.only(left: 23,right: 23,top: 8),
              child: Text('Test User',style: TextStyle(fontFamily: 'Raleway',fontWeight: FontWeight.w500,))),
              
              Padding(padding: EdgeInsets.only(left: 23,right: 23,top: 8),
              child: Divider(thickness: 1,),),

              Padding(padding: EdgeInsets.only(left: 23,right: 23,top: 8),
              child: Row(
                children: [
                  Text("Client's Name :",style: TextStyle(fontFamily: 'Raleway',fontSize: 16,fontWeight: FontWeight.w500,color: Color.fromRGBO(9, 44, 76, 1))),
                  Text("*",style: TextStyle(color: Colors.red,fontSize: 30),)
                ],
              )),

               Padding(padding: EdgeInsets.only(left: 23,right: 23,),
               child: TextFormField(autocorrect: true,
               autofocus: false,
                 decoration: InputDecoration(
                   contentPadding: new EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
                   hintText: 'Enter Full Name',
                   border: OutlineInputBorder(
                     borderSide: BorderSide(color: Colors.black)
                   )
                 ),
               ),),  

              Padding(padding: EdgeInsets.only(left: 23,right: 23,top: 8),
              child: Text('NRC No. :',style: TextStyle(fontFamily: 'Raleway',fontSize: 16,fontWeight: FontWeight.w500,color: Color.fromRGBO(9, 44, 76, 1)))), 

              Padding(padding: EdgeInsets.only(left: 23,right: 23,),
               child: TextFormField(autocorrect: true,
               autofocus: false,
                 decoration: InputDecoration(
                   contentPadding: new EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
                   hintText: 'N/A',
                   border: OutlineInputBorder(
                     borderSide: BorderSide(color: Colors.black)
                   )
                 ),
               ),), 

                 Padding(padding: EdgeInsets.only(left: 23,right: 23,top: 8),
              child: Row(
                children: [
                  Text("Marital Status :",style: TextStyle(fontFamily: 'Raleway',fontSize: 16,fontWeight: FontWeight.w500,color: Color.fromRGBO(9, 44, 76, 1))),
                  Text("*",style: TextStyle(color: Colors.red,fontSize: 30),)
                ],
              )),   

               Padding(padding: EdgeInsets.only(left: 23,right: 23,),
               child: TextFormField(autocorrect: true,
               autofocus: false,
                 decoration: InputDecoration(
                   suffixIcon: IconButton(icon: FaIcon(FontAwesomeIcons.arrowAltCircleDown), onPressed: (){}),
                   contentPadding: new EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
                   hintText: 'Select Marital Status',
                   border: OutlineInputBorder(
                     borderSide: BorderSide(color: Colors.black)
                   )
                 ),
               ),),         
            ],
          )),
        ),
        
      ),
    );
  }
}