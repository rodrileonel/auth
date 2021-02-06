import 'package:auth/services/google_signin.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final googleSignIn = GoogleSignInService();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
          actions: [
            IconButton(
              onPressed: (){ googleSignIn.logoutGoogle(); },
              icon: Icon(FontAwesomeIcons.doorOpen)
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  height: 50,
                  color: Colors.red,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  onPressed: () async { 
                    final user = await googleSignIn.loginGoogle();
                    print(user);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.google, color: Colors.white,),
                      Text('oogle sign In',style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
                //apple/facebook button
              ],
            ),
          ),
        ),
      ),
    );
  }
}