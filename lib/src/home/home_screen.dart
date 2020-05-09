import 'package:avatar_glow/avatar_glow.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:health_care/animation/delayanimation.dart';
import 'package:health_care/authentication/facebook_auth.dart';
import 'package:health_care/authentication/google_auth.dart';
import 'package:health_care/src/dashboard/dashboard_screen.dart';
import 'package:health_care/src/option/male_female_radio.dart';
import 'package:health_care/utils/images.dart';
import 'package:health_care/widget/button.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final int delayedAmount = 500;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          _buildBackground(),
          _buildTextAnimation('Xin chào', delayedAmount),
          SizedBox(height: 20),
          _buildTextAnimation('HEALTH TRACKING', delayedAmount + 200),
          SizedBox(height: 20),
          DelayedAnimtion(
            widget: Container(
              width: 400,
              alignment: Alignment.center,
              child: Text(
                'Chúng tôi sẽ giúp bạn đạt được kết quả tuyệt vời, trong một khoảng thời gian ngắn',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontFamily: 'muli',
                    fontSize: 20),
              ),
            ),
            delayDuration: delayedAmount + 600,
            anioffsetX: 0.0,
            anioffsetY: 0.35,
            aniDuration: 700,
          ),
          SizedBox(
            height: 30.0,
          ),
          _buildButtonAnimation('Facebook', 800, () {
            signinWithFacebook().whenComplete(() => Navigator.push(
                context, MaterialPageRoute(builder: (_) => DashBoardScreen())));
          }),
          SizedBox(
            height: 15.0,
          ),
          _buildButtonAnimation('Google ', 1000, () {
            signInWithGoogle().whenComplete(() => Navigator.push(
                context, MaterialPageRoute(builder: (_) => DashBoardScreen())));
          }),
        ],
      ),
    );
  }

  _buildBackground() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      alignment: Alignment.center,
      child: Image.asset(
        Images.bgHealth,
        fit: BoxFit.contain,
      ),
    );
  }

  _buildTextAnimation(String text, int delayedAmount) {
    return DelayedAnimtion(
      widget: Text(
        text ?? '',
        style: TextStyle(
            color: Colors.black,
            fontFamily: "muli",
            letterSpacing: 1.5,
            fontWeight: FontWeight.bold,
            fontSize: 25),
      ),
      delayDuration: delayedAmount,
      anioffsetX: 0.0,
      anioffsetY: 0.35,
      aniDuration: 700,
    );
  }

  _buildButtonAnimation(String title, int delay, Function onTap) {
    Color color = title == 'Facebook' ? Colors.blueAccent : Colors.redAccent;
    return DelayedAnimtion(
      delayDuration: delayedAmount + delay,
      anioffsetX: 0.0,
      anioffsetY: 0.35,
      aniDuration: 700,
      widget: CustomButton(
        color: color,
        title: 'Login $title',
        style: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        onTap: onTap,
      ),
    );
  }
}
