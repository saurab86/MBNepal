import 'package:blurry/blurry.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mbnepal/authentication/sign_in_google.dart';
import 'package:mbnepal/screens/home.dart';

bool loading = false;
class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
 
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(196, 196, 196, 0.2),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          
        ),
        body: SafeArea(child: Body()),
      ),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController _pinCOntroller;
  @override
   void initState(){
    super.initState();
    _pinCOntroller=TextEditingController();
  }
  Widget build(BuildContext context) {
      return FractionallySizedBox(
            alignment: Alignment.center,
            widthFactor: 1,
            heightFactor: 1,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 60,right: 60),
                    child: Image.asset("images/creditappraisal.png"),
                  ),SizedBox(height: 20,),

                    Text("Credit Appraisal System",style: TextStyle(fontFamily: 'RaleWay',fontSize: 19,fontWeight: FontWeight.bold,color: Colors.brown)),
                    SizedBox(height: 12,),
                    Text("Version: 1.1.15",style: TextStyle(color: Colors.grey),),

                   Padding(
                    padding: const EdgeInsets.only(left: 20,right:20,top: 10),
                    child: Container(
                    height: 380,
                    width: MediaQuery.of(context).size.width-20,
                    color: Color.fromRGBO(196, 196, 196, 0.3),
                    child: Column(children: [
                      SizedBox(height: 20,),
                      
                      Text("LOGIN",style: TextStyle(fontFamily: 'Raleway',fontSize: 20,fontWeight: FontWeight.bold,)),SizedBox(height: 25,),

                      Text("Welcome Test User",style: TextStyle(color: Colors.brown),),SizedBox(height: 15),

                      TextButton(onPressed: (){}, child: Text("Change Language :",style: TextStyle(fontSize: 16),)),SizedBox(height: 20,),

                      Padding(
                        padding: const EdgeInsets.only(left: 15,right: 15),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: _pinCOntroller,
                          decoration: InputDecoration(
                            hintText: 'Enter Pin',
                            hintStyle: TextStyle(fontFamily: 'Raleway'),
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(7)))
                          ),
                        ),
                      ),SizedBox(height: 10,),
                      Text('"LicenseKey not found. Please get liscense for your device with id":',style: TextStyle(color:Colors.red)),
                      Text('"358514080711151"',style: TextStyle(color: Colors.red)),
                      SizedBox(height: 15,),

                      Padding(
                        padding: const EdgeInsets.only(left: 18,right: 18),
                        child: SizedBox(height: 40,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(onPressed: (){
                          if(_pinCOntroller.text == null){
                            Blurry.error(title: 'Alert', description: 'Please Enter Pin', confirmButtonText: 'Okay', onConfirmButtonPressed: ()=>Navigator.pop(context));
                          }else{
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomePage()));
                          }
                        }, child: Text('LOGIN',style: TextStyle(fontFamily: 'Raleway',fontSize: 18),),
                        style: ElevatedButton.styleFrom(primary: Color.fromRGBO(13,54,146,1)))),
                      ),SizedBox(height: 15),

                      Text('Pin for Test User: 0000',style: TextStyle(fontSize: 17,fontFamily: 'RaleWay'))
                    ],),
                    ),
                  ),

                  SizedBox(height: 20,),

                  TextButton(onPressed: (){}, child: Text('Select different database',style: TextStyle(fontFamily: 'RaleWay',fontSize: 18,color: Color.fromRGBO(13,54,146,1)))),
                  SizedBox(height: 20),

                  Text('A Product of Microbanker Nepal Pvt. Ltd.',style: TextStyle(fontFamily: 'Raleway',color: Colors.grey,fontSize: 17,fontWeight: FontWeight.w500)),

                  Padding(
                    padding: const EdgeInsets.only(left:50,right: 50),
                    child: Image(image: AssetImage("images/mb_logo.png",),
                      fit: BoxFit.fitHeight,
                    ),
                  ),

                  Padding(padding: EdgeInsets.only(left: 20,right: 20),
                  child: Divider(thickness: 1.5,),),


                  Column(
                    children: [
                      Container(
                        width: 250,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          onPressed: () {
                            signInWithGoogle().then((userDetails) {
                              if (userDetails != null) {
                                setState(() => loading = true);
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HomePage(userDetails: userDetails)),
                                  (Route<dynamic> route) => false,
                                );
                              } else {
                                setState(() {
                                  print("Error in Sign in With Google!");
                                  loading = false;
                                });

                                showModalBottomSheet(context: context, builder: (builder)=>
                                 Container(
                                   color: Colors.transparent,
                                   height: 350,
                                   decoration: BoxDecoration(
                                     color: Colors.white,
                                     borderRadius: BorderRadius.all(Radius.circular(10))),
                                     child: Center(
                                       child: Column(
                                         children: [
                                           Text("Could not SignIn. Please try again later.")
                                         ],
                                       ),
                                     ),
                                 ));
                              }
                            });
                          },
                          color: Colors.white,
                          shape: StadiumBorder(),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "images/google_logo.png",
                                height: 32,
                              ),
                              Text(
                                "Sign in with Google",
                                style: TextStyle(
                                    fontFamily: 'Raleway', fontSize: 16),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
    
  }
}
