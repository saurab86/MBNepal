import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return loading
        ? CircularProgressIndicator()
        : FractionallySizedBox(
            alignment: Alignment.center,
            widthFactor: 1,
            heightFactor: 1,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage(
                      "images/mb_logo.png",
                    ),
                    fit: BoxFit.fitHeight,
                  ),
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
                  )
                ],
              ),
            ),
          );
  }
}
