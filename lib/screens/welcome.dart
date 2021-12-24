import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
const btnwidth = 25;
class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
        ),
        backgroundColor: Color.fromRGBO(13, 54, 146,1),
        title: Text("Credit Appraisal System",style: TextStyle(fontSize: 22,fontFamily: 'Raleway',fontWeight: FontWeight.w600),),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 45,),
            Padding(
              padding: const EdgeInsets.only(left: 60,right: 60),
              child: Image.asset("images/creditappraisal.png",),
            ),
            SizedBox(height: 15,),

            Text("Credit Appraisal",style: TextStyle(fontFamily: 'RaleWay',fontWeight: FontWeight.bold,fontSize: 20),),

            SizedBox(height: 55,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("This device us not registered. Please register this device using a valid liscense in the MBWin System. Please use the IMEINumber of this device to register. IMEI Number of this device is 35851408071151",
              style: TextStyle(fontSize: 18,fontFamily: 'Raleway',fontWeight: FontWeight.bold),),
            ),SizedBox(height:25),
    
           SizedBox(height: 40,
           width: MediaQuery.of(context).size.width-btnwidth,
           child: ElevatedButton(onPressed: (){}, child: Text('SAVE REGISTRATION KEY',style: TextStyle(fontSize: 18,fontFamily: 'Raleway'),
           ),style: ElevatedButton.styleFrom(primary: Color.fromRGBO(13,54,146,1)),), ),SizedBox(height: 25),


           SizedBox(height: 40,
           width: MediaQuery.of(context).size.width-btnwidth,
           child: ElevatedButton(onPressed: (){},
           child: Text('PICK DATABASE',style: TextStyle(fontSize: 18,fontFamily: 'RaleWay'),),
           style: ElevatedButton.styleFrom(primary: Color.fromRGBO(13,54,146,1)),
           )),SizedBox(height: 25,),

           SizedBox(height: 40,
           width: MediaQuery.of(context).size.width-btnwidth,
           child: ElevatedButton(onPressed: (){},child: Text('ENTER AS TEST USER',style: TextStyle(fontFamily: 'Raleway',fontSize:18),),
           style: ElevatedButton.styleFrom(primary: Color.fromRGBO(13, 54, 146, 1))),)

          

          ],
        ),
      ),
    );
  }
}