import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:splashscreen/splashscreen.dart';

import 'Home/HomeScreen.dart';

class WelcomeSplashScreen extends StatefulWidget {
  @override
  _WelcomeSplashScreenState createState() => _WelcomeSplashScreenState();
}

class _WelcomeSplashScreenState extends State<WelcomeSplashScreen> {
  bool firstLogin = false;
  bool intenet = true;
  String loginToken, usertype = "";

  void checkconnection() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      setState(() {
        intenet = true;
      });
    } else {
      setState(() {
        intenet = false;
      });
      Fluttertoast.showToast(
          msg: "Please Check Your Internet Connection",
          toastLength: Toast.LENGTH_LONG);
    }
  }

  @override
  void initState() {
    super.initState();
    checkconnection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: intenet
            ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: Colors.white,
                height: 200,
              ),
              Expanded(
                child: SplashScreen(
                  seconds: 5,
                  navigateAfterSeconds:
                      HomeScreen(),
                  title: Text("HD Quote",style: TextStyle(
                    fontSize: 20
                  ),),
                  image: Image(
                    image: AssetImage("assets/argon medical.jpeg"),
                  ),
                  photoSize: 150.0,
                  useLoader: false,
                ),
              )
            ],
          ),
        )
            : Container(
          child: Text("Please Check Your Connection"),
        ));
  }
}
