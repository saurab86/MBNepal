import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blurry/blurry.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mbnepal/Dropdowns/marital_status.dart';
import 'package:mbnepal/dbhelper.dart';
import 'package:mbnepal/screens/databaseAdapter.dart';
import 'package:mbnepal/screens/home.dart';
import 'package:path_provider/path_provider.dart';


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

class NameList {  
   String _name; 
    NameList(this._name);  
  NameList.fromMap(dynamic obj) {  
    this._name = obj['name'];  
  }  
  
  String get name => _name;  
  Map<String, dynamic> toMap() {  
    var map = new Map<String, dynamic>();  
    map["name"] = _name;  
    return map;  
  }  
} 
class GeneralInformationForm extends StatefulWidget {
  
  @override
  _GeneralInformationFormState createState() => _GeneralInformationFormState();
}

class _GeneralInformationFormState extends State<GeneralInformationForm> {
  final dbhelper = DataBaseHelper.instance;  
  String path;
  String choosenValue;   
  DbAdapter dbAdapter = new DbAdapter();
 var items = [];
   void insertdata() async{
     Map<String,dynamic> row = {
       DataBaseHelper.columnName:'Messi',
       DataBaseHelper.columnage:'34',
     };
     final id = await dbhelper.insert(row);
     print(id);
   }
  
  void queryall() async{
    Directory documentdirectory = await getExternalStorageDirectory();
    var allrows = await dbhelper.queryallrow();
    allrows.forEach((row) {print(row); });
    print(documentdirectory);
    
  }

  void queryspec() async{
     var allrows = await dbhelper.querySpecific(4);
     print(allrows);
  }

  void delete() async{
    var id = await dbhelper.deletedata(4);
    print(id);
  }

 void update() async{
   var row = await dbhelper.update(2);
   print(row);
 }

 selectoption() async{
  var row = await dbhelper.selectoption();
     row.forEach((row) {print(row);});
     setState(() {
            items = row;
          });
}

 
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
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light, // For Android (dark icons)
          ),
          backgroundColor: Color.fromRGBO(13, 54, 146,1),
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
          physics: BouncingScrollPhysics(),
          child: Form(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              //Appraisal Number
              Padding(padding: EdgeInsets.only(left: 23,right: 23,top: 35),
              child: Text('Appraisal Number :',style: TextStyle(fontFamily: 'Raleway',fontSize: 16,fontWeight: FontWeight.w500,color: Color.fromRGBO(9, 44, 76, 1)))),
              Padding(padding: EdgeInsets.only(left: 23,right: 23,top: 8),
              child: Text('00000200000122122021000002',style: TextStyle(fontFamily: 'Raleway',fontSize: 17,fontWeight: FontWeight.w500))),
              
              Padding(padding: EdgeInsets.only(left: 23,right: 23,top: 8),
              child: Divider(thickness: 1,),),

              //CO Name
              Padding(padding: EdgeInsets.only(left: 23,right: 23,top: 8),
              child: Text('CO Name :',style: TextStyle(fontFamily: 'Raleway',fontSize: 16,fontWeight: FontWeight.w500,color: Color.fromRGBO(9, 44, 76, 1)))),
              Padding(padding: EdgeInsets.only(left: 23,right: 23,top: 8),
              child: Text('Test User',style: TextStyle(fontFamily: 'Raleway',fontWeight: FontWeight.w500,))),
              
              Padding(padding: EdgeInsets.only(left: 23,right: 23,top: 8),
              child: Divider(thickness: 1,),),

              // Client's Name
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
                   hintStyle: TextStyle(fontFamily: 'Raleway',fontSize: 18),
                   border: OutlineInputBorder(
                     borderSide: BorderSide(color: Colors.black)
                   )
                 ),
               ),),  

              //NRC Number
              Padding(padding: EdgeInsets.only(left: 23,right: 23,top: 8),
              child: Text('NRC No. :',style: TextStyle(fontFamily: 'Raleway',fontSize: 16,fontWeight: FontWeight.w500,color: Color.fromRGBO(9, 44, 76, 1)))), 
              Padding(padding: EdgeInsets.only(left: 23,right: 23,),
               child: TextFormField(autocorrect: true,
               autofocus: false,
               enabled: false,
                 decoration: InputDecoration(
                   contentPadding: new EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
                   hintText: 'N/A',
                   hintStyle: TextStyle(fontFamily: 'Raleway',fontSize: 18),
                   border: OutlineInputBorder(
                     borderSide: BorderSide(color: Colors.black)
                   )
                 ),
               ),), 

              // Maritail Status
              Padding(padding: EdgeInsets.only(left: 23,right: 23,top: 8),
              child: Row(
                children: [
                  Text("Marital Status :",style: TextStyle(fontFamily: 'Raleway',fontSize: 16,fontWeight: FontWeight.w500,color: Color.fromRGBO(9, 44, 76, 1))),
                  Text("*",style: TextStyle(color: Colors.red,fontSize: 30),)
                ],
              )),   
               Padding(padding: EdgeInsets.only(left: 23,right: 23,),
               child:Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.grey)),
                 child: Row(mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     IconButton(icon: Icon(Icons.arrow_drop_down,size: 35,color: Color.fromRGBO(13, 54, 146,1),), onPressed: (){
                       Navigator.push(context, MaterialPageRoute(builder: (_)=>MaritalStatusSpinner()));
                     }),
                   ],
                 )
               )),
               
               
              // Contact Number
              Padding(padding: EdgeInsets.only(left: 23,right: 23,top: 8),
              child: Row(
                children: [
                  Text("Mobile Number :",style: TextStyle(fontFamily: 'Raleway',fontSize: 16,fontWeight: FontWeight.w500,color: Color.fromRGBO(9, 44, 76, 1))),
                  Text("*",style: TextStyle(color: Colors.red,fontSize: 30),)
                ],
              )), 
              Padding(padding: EdgeInsets.only(left: 23,right: 23,),
               child: TextFormField(autocorrect: true,
               autofocus: false,
               keyboardType: TextInputType.phone,
                 decoration: InputDecoration(
                   contentPadding: new EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
                   hintText: '+977-',
                   hintStyle: TextStyle(fontFamily: 'Raleway',fontSize: 18),
                   border: OutlineInputBorder(
                     borderSide: BorderSide(color: Colors.black)
                   )
                 ),
               ),), 

          //Loan Purpose
          Padding(padding: EdgeInsets.only(left: 23,right: 23,top: 8),
              child: Row( children: [
                  Text("Loan Purpose :",style: TextStyle(fontFamily: 'Raleway',fontSize: 16,fontWeight: FontWeight.w500,color: Color.fromRGBO(9, 44, 76, 1))),
                  Text("*",style: TextStyle(color: Colors.red,fontSize: 30),)
                ],
              )),   
               Padding(padding: EdgeInsets.only(left: 23,right: 23,),
               child: TextFormField(autocorrect: true,
               autofocus: false,
                 decoration: InputDecoration(
                   suffixIcon: IconButton(icon: FaIcon(FontAwesomeIcons.arrowAltCircleDown), onPressed: (){}),
                   contentPadding: new EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
                   hintText: 'Select Loan Purpose',
                   hintStyle: TextStyle(fontFamily: 'Raleway',fontSize: 18),
                   border: OutlineInputBorder(
                     borderSide: BorderSide(color: Colors.black)
                   )
                 ),
               ),), 

          //Product Code
          Padding(padding: EdgeInsets.only(left: 23,right: 23,top: 8),
              child: Row( children: [
                  Text("Product Code :",style: TextStyle(fontFamily: 'Raleway',fontSize: 16,fontWeight: FontWeight.w500,color: Color.fromRGBO(9, 44, 76, 1))),
                  Text("*",style: TextStyle(color: Colors.red,fontSize: 30),)
                ],
              )),   
               Padding(padding: EdgeInsets.only(left: 23,right: 23,),
               child: TextFormField(autocorrect: true,
               autofocus: false,
               enabled: false,
                 decoration: InputDecoration(
                   suffixIcon: IconButton(icon: FaIcon(FontAwesomeIcons.arrowAltCircleDown), onPressed: (){}),
                   contentPadding: new EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
                   hintText: 'Select Product Code',
                   hintStyle: TextStyle(fontFamily: 'Raleway',fontSize: 18),
                   border: OutlineInputBorder(
                     borderSide: BorderSide(color: Colors.black)
                   )
                 ),
               ),),     

          //Sub Product Code
          Padding(padding: EdgeInsets.only(left: 23,right: 23,top: 8),
              child: Row( children: [
                  Text("Sub Product Code :",style: TextStyle(fontFamily: 'Raleway',fontSize: 16,fontWeight: FontWeight.w500,color: Color.fromRGBO(9, 44, 76, 1))),
                  Text("*",style: TextStyle(color: Colors.red,fontSize: 30),)
                ],
              )),   
               Padding(padding: EdgeInsets.only(left: 23,right: 23,),
               child: TextFormField(autocorrect: true,
               autofocus: false,
               enabled: false,
                 decoration: InputDecoration(
                   suffixIcon: IconButton(icon: FaIcon(FontAwesomeIcons.arrowAltCircleDown), onPressed: (){}),
                   contentPadding: new EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
                   hintText: 'Select Sub Product Code',
                   hintStyle: TextStyle(fontFamily: 'Raleway',fontSize: 18),
                   border: OutlineInputBorder(
                     borderSide: BorderSide(color: Colors.black)
                   )
                 ),
               ),),  

            //Requested Loan Amount
            Padding(padding: EdgeInsets.only(left: 23,right: 23,top: 8),
              child: Row(
                children: [
                  Text("Requested Loan Amount :",style: TextStyle(fontFamily: 'Raleway',fontSize: 16,fontWeight: FontWeight.w500,color: Color.fromRGBO(9, 44, 76, 1))),
                  Text("*",style: TextStyle(color: Colors.red,fontSize: 30),)
                ],
              )), 
              Padding(padding: EdgeInsets.only(left: 23,right: 23,),
               child: TextFormField(autocorrect: true,
               autofocus: false,
               keyboardType: TextInputType.number,
                 decoration: InputDecoration(
                   contentPadding: new EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
                   hintText: 'Enter Loan Amount',
                   hintStyle: TextStyle(fontFamily: 'Raleway',fontSize: 18),
                   border: OutlineInputBorder(
                     borderSide: BorderSide(color: Colors.black)
                   )
                 ),
               ),), 
               
              //Re-Payment Frequency
               Padding(padding: EdgeInsets.only(left: 23,right: 23,top: 8),
              child: Row( children: [
                  Text("Re-Payment Frequency :",style: TextStyle(fontFamily: 'Raleway',fontSize: 16,fontWeight: FontWeight.w500,color: Color.fromRGBO(9, 44, 76, 1))),
                  Text("*",style: TextStyle(color: Colors.red,fontSize: 30),)
                ],
              )),   
               Padding(padding: EdgeInsets.only(left: 23,right: 23,),
               child: TextFormField(autocorrect: true,
               autofocus: false,
               enabled:false,
                 decoration: InputDecoration(
                   suffixIcon: IconButton(icon: FaIcon(FontAwesomeIcons.arrowAltCircleDown), onPressed: (){}),
                   contentPadding: new EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
                   hintText: 'Select Sub Product Code',
                   hintStyle: TextStyle(fontFamily: 'Raleway',fontSize: 18),
                   border: OutlineInputBorder(
                     borderSide: BorderSide(color: Colors.black)
                   )
                 ),
               ),), 
            SizedBox(height:10 ,),

          //Next and Reset button 
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 45,width: 120,
                child: ElevatedButton(onPressed: queryall, child: Text("Reset",style: TextStyle(fontFamily:'Raleway',fontSize: 20),),
                style: ElevatedButton.styleFrom(primary: Color.fromRGBO(9, 44, 76, 1)),
                )),

                SizedBox(
                height: 45,width: 120,
                child: ElevatedButton(onPressed:insertdata,
                 child: Text("Next",style: TextStyle(fontFamily:'Raleway',fontSize: 20,color: Color.fromRGBO(9, 44, 76, 1)),),
                style: ElevatedButton.styleFrom(primary: Color.fromRGBO(253, 253, 253, 1),side: BorderSide(color: Colors.red, width: 2),),
                ))
            ],
          ),
          SizedBox(height: 20,),


          //
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 45,width: 120,
                child: ElevatedButton(onPressed: queryspec, child: Text("Query Specific",style: TextStyle(fontSize: 20,fontFamily: 'Raleway'),),
                style: ElevatedButton.styleFrom(primary: Color.fromRGBO(8, 30, 76, 1)),
                )),

                SizedBox(
                height: 45,width: 120,
                child: ElevatedButton(onPressed:selectoption,
                 child: Text("Name List",style: TextStyle(fontFamily: 'Raleway',fontSize: 20,color: Color.fromRGBO(9, 44, 76, 1)),),
                style: ElevatedButton.styleFrom(primary: Color.fromRGBO(253, 253, 253, 1),side: BorderSide(color: Colors.red, width: 2),),
                ))
            ],
          ),

      TextButton(onPressed: (){dbAdapter.initDb();}, child: Text('Next'))
            ],
          )),
        ),
        
      ),
    );
  }
}