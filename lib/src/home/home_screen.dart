
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:health_care/animation/delayanimation.dart';
import 'package:health_care/src/option/male_female_radio.dart';
import 'package:health_care/utils/images.dart';


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
          _buildAvatarGlow(),
          _buildTextAnimation('Xin chào',delayedAmount),
          SizedBox(height:20),
          _buildTextAnimation('Hôm nay bạn uống nước chưa',delayedAmount+200),
          SizedBox(height:20),
          DelayedAnimtion(
            widget: Container(
              width: 300,
              alignment: Alignment.center,
              child: Text(
                'Chúng tôi sẽ nhắc bạn uống nước mỗi ngày',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black
                        .withOpacity(0.5),
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
          _buildButtonAnimation(),
          
        ],
      ),
    );
  }

  _buildAvatarGlow(){
    return Container(
      margin: EdgeInsets.only(top:30),
      alignment: Alignment.center,
      child: AvatarGlow(
        endRadius: 150,
        duration: Duration(seconds: 2),
        glowColor: Colors.blue,
        repeat: true,
        repeatPauseDuration: Duration(seconds: 2),
        startDelay: Duration(seconds: 1),  
        child: Material(
          elevation: 8.0,
          shape: CircleBorder(),
          child: CircleAvatar(
            backgroundColor: Colors.grey[100],
            child: FlareActor(
              Images.flareWaterBody,
              animation: "waterFalling"
            ),
            radius: 80,
          ),
        ),
      ),
    );
  }

  _buildTextAnimation(String text,int delayedAmount){
    return DelayedAnimtion(
      widget: Text(
        text??'',
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

  _buildButtonAnimation(){
    return DelayedAnimtion(
      delayDuration: delayedAmount + 800,
      anioffsetX: 0.0,
      anioffsetY: 0.35,
      aniDuration: 700,
        widget: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=> MaleFemaleRadio()));
        },
        child: Container(
          height: 60,
          width: 270,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            color: Colors.blue,
          ),
          child: Center(
            child: Text(
              'Bắt đầu !',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
