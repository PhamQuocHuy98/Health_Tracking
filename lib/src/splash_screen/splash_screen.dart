import 'dart:async';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:health_care/src/home/home_screen.dart';
import 'package:health_care/utils/images.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomeScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: Colors.white,
      body: Builder(builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                height: 350,
                width: 350,
                child: FlareActor(
                  Images.flareGlassLoading1,
                  animation: "sujan",
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                  // alignment: Alignment.center,
                ),
              ),
            ),
            Center(
              child: Text(
                "Vui lòng đợi...",
                style: TextStyle(
                    fontFamily: "muli", fontSize: 20),
              ),
            ),
          ],
        );
      }),
    );
  }
}
