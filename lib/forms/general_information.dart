import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blurry/blurry.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mbnepal/dbhelper.dart';
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
  final dbhelper = DataBaseHelper.instance;
   
   void insertdata() async{
     Map<String,dynamic> row = {
       DataBaseHelper.columnName:'Saurav',
       DataBaseHelper.columnage:'22'
     };
     final id = await dbhelper.insert(row);
     print(id);
   }
  
  void queryall() async{
    var allrows = await dbhelper.queryallrow();
    allrows.forEach((row) {print(row); });
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
                 decoration: InputDecoration(
                   contentPadding: new EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
                   hintText: 'N/A',
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
                 decoration: InputDecoration(
                   suffixIcon: IconButton(icon: FaIcon(FontAwesomeIcons.arrowAltCircleDown), onPressed: (){}),
                   contentPadding: new EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
                   hintText: 'Select Product Code',
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
                 decoration: InputDecoration(
                   suffixIcon: IconButton(icon: FaIcon(FontAwesomeIcons.arrowAltCircleDown), onPressed: (){}),
                   contentPadding: new EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
                   hintText: 'Select Sub Product Code',
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
                 decoration: InputDecoration(
                   suffixIcon: IconButton(icon: FaIcon(FontAwesomeIcons.arrowAltCircleDown), onPressed: (){}),
                   contentPadding: new EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
                   hintText: 'Select Sub Product Code',
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
                child: ElevatedButton(onPressed: queryall, child: Text("Reset",style: TextStyle(fontSize: 20),),
                style: ElevatedButton.styleFrom(primary: Color.fromRGBO(9, 44, 76, 1)),
                )),

                SizedBox(
                height: 45,width: 120,
                child: ElevatedButton(onPressed:insertdata,
                 child: Text("Next",style: TextStyle(fontSize: 20,color: Color.fromRGBO(9, 44, 76, 1)),),
                style: ElevatedButton.styleFrom(primary: Color.fromRGBO(253, 253, 253, 1),side: BorderSide(color: Colors.red, width: 2),),
                ))
            ],
          ),
          SizedBox(height: 20,),
      
            ],
          )),
        ),
        
      ),
    );
  }
}