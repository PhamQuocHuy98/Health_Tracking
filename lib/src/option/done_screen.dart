import 'package:avatar_glow/avatar_glow.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_care/animation/delayanimation.dart';
import 'package:health_care/src/dashboard/dashboard_screen.dart';
import 'package:health_care/src/dashboard/setting/setting_model.dart';
import 'package:health_care/utils/images.dart';
import 'package:health_care/widget/button.dart';
import 'package:hive/hive.dart';

class DoneNotifiScreen extends StatefulWidget {
  @override
  _DoneNotifiScreenState createState() => _DoneNotifiScreenState();
}

class _DoneNotifiScreenState extends State<DoneNotifiScreen> {
  int delayedAmount=500;
  bool valueSwitch =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height:100),
            DelayedAnimtion(
              delayDuration: delayedAmount + 200,
              anioffsetX: 0.0,
              anioffsetY: 0.35,
              aniDuration: 700,
                widget: AvatarGlow(
                endRadius: 200,
                duration: Duration(milliseconds: 1500),
                glowColor: Colors.black,
                repeat: true,
                repeatPauseDuration: Duration(milliseconds: 1500),
                startDelay: Duration(seconds: 1),  
                child: FlareActor(
                  Images.flareNoti,
                  animation: "Play",
                  fit: BoxFit.cover,
                  isPaused: !mounted,
                  shouldClip: false,
                ),
              ),
            ),
            DelayedAnimtion(
              widget: Text('Cho phép nhận thông báo',style: TextStyle(
                color:Colors.white,
                fontSize: 20,
              ),),
              delayDuration: delayedAmount + 400,
              anioffsetX: 0.0,
              anioffsetY: 0.35,
              aniDuration: 700,
            ),
            SizedBox(height:30),
            DelayedAnimtion(
            delayDuration: delayedAmount + 600,
            anioffsetX: 0.0,
            anioffsetY: 0.35,
            aniDuration: 700,
                widget: Transform.scale(
                scale: 1.5,
                child: CupertinoSwitch(
                  value: valueSwitch, 
                  onChanged: (vl){
                    setState(() {
                      valueSwitch=vl;
                    });
                  },
                  activeColor: Colors.red,
                  
                ),
              ),
            ),
            SizedBox(height:30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: DelayedAnimtion(
                anioffsetY: 1.00,
                anioffsetX: 0.0,
                delayDuration: delayedAmount + 800,
                aniDuration: 700,
                widget: CustomButton(
                  width: 300,
                  height: 60,
                  title: 'Xong',
                  color: Colors.white,
                  onTap: (){
                    var box = Hive.box<SettingModel>('dbSetting');
                    SettingModel setting;
                    setting=box.getAt(0);
                    setting.acceptNoti=valueSwitch;
                    Hive.box<SettingModel>('dbSetting')..putAt(0,setting);
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> DashBoardScreen(

                    )));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}