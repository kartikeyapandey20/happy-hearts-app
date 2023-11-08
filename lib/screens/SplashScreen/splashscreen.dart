import 'dart:async';
import 'package:flutter/material.dart';
import 'package:happyheart/screens/Dashboard/dashBoard.dart';
import 'package:happyheart/screens/getStarted/get_started.dart';
import 'package:happyheart/utils/image_path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Constant/background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool? name;
  getDataFromSession() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    name = preferences.getBool("login");
  }
  @override
  void initState() {
    super.initState();
    getDataFromSession();
    print(name);
    // FlutterSound flutterSound = FlutterSound();
    // flutterSound.thePlayer.startPlayer(fromURI: 'assets/test.mp3');
    Timer(Duration(seconds: 5),
            ()=>name == null?Navigator.pushReplacement(context,
                MaterialPageRoute(builder:
                    (context) => GetStarted()
                )
            ): Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) => DashBoard()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundSetup(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(ImagePath.happyHeartLogo,fit: BoxFit.cover,),

            ],
          ),
        ),
      ),
    );
  }
}
