import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_care/animation/delayanimation.dart';
import 'package:health_care/utils/images.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final int delayedAnimation=500;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cài đặt uống nước'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
             
            DelayedAnimtion(
               delayDuration: delayedAnimation + 200,
                anioffsetX: 0.35,
                anioffsetY: 0.35,
                aniDuration: 700,
                widget: Container(
                margin: EdgeInsets.only(left: 10,top: 10,),
                child: Row(
                  children: <Widget>[
                    _buildDot(),
                    SizedBox(width: 10,),
                    Text('Cài đặc nhắc nhở'),
                  ],
                ),
              ),
            ),
            DelayedAnimtion(
                delayDuration: delayedAnimation + 500,
                anioffsetX: 0.35,
                anioffsetY: 0.35,
                aniDuration: 700,
                widget: Container(
                margin: EdgeInsets.only(left: 10,right:10,top: 20),
                padding: EdgeInsets.only(top:10,bottom:10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                    color: Colors.black12,
                    blurRadius: 2.0,
                    ),
                  ]
                ),
                child: Column(
                  children: <Widget>[
                    _buildItemProfile(
                      'Cho phép nhắc nhở',
                      Switch(
                        value: true, 
                        onChanged: (vl){},
                        activeColor: Colors.blue,
                      ),
                      delayedAnimation + 800,
                    ),
                    _buildItemProfile(
                      'Nhắt nhở khi hoàn thành',
                      Switch(
                        value: true, 
                        onChanged: (vl){},
                        activeColor: Colors.blue,
                      ),
                      delayedAnimation + 1000,
                    ),
                    _buildItemProfile(
                      'Giờ thức dậy',
                      Text(
                        '07:00',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                        ),
                      ),
                      delayedAnimation + 1200,
                    ),
                    _buildItemProfile(
                      'Giờ ngủ',
                      Text(
                        '23:00',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                        ),
                      ),
                      delayedAnimation + 1400,
                    ),
                    _buildItemProfile(
                      'Khoảng thời gian nhắc nhở',
                      Text(
                        '1 giờ',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                        ),
                      ),
                      delayedAnimation + 1600,
                    ),
                    
                  ],
                ),
              ),
            ),
            DelayedAnimtion(
                delayDuration: delayedAnimation + 1800,
                anioffsetX: 0.35,
                anioffsetY: 0.35,
                aniDuration: 700,
                widget: Container(
                margin: EdgeInsets.only(left: 10,top: 10,),
                child: Row(
                  children: <Widget>[
                    _buildDot(),
                    SizedBox(width: 10,),
                    Text('Chung'),
                  ],
                ),
              ),
            ),
            DelayedAnimtion(
              delayDuration: delayedAnimation + 2000,
                anioffsetX: 0.35,
                anioffsetY: 0.35,
                aniDuration: 700,
                widget: Container(
                margin: EdgeInsets.only(left: 10,right:10,top: 20),
                padding: EdgeInsets.only(top:10,bottom:10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                    color: Colors.black12,
                    blurRadius: 2.0,
                    ),
                  ],
                  
                ),
                child: Column(
                  children: <Widget>[
                    _buildItemProfile(
                      'Mục tiêu hằng ngày',
                      Text(
                        '2.245 ml',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                        ),
                      ),
                      delayedAnimation + 2200,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

    
  }

  Widget _buildDot({Color color=Colors.blue}){
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
         color: color
      ),
    );
  }

  Widget _buildItemProfile(String title,Widget widget,int delay,{Color color = Colors.transparent}){
      return DelayedAnimtion(
          delayDuration: delay,
          anioffsetX: 0.0,
          anioffsetY: 0.35,
          aniDuration: 700,
          widget: Container(
          color: color,
          height: 50,
          margin: EdgeInsets.only(left: 10,right:10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(title),
              widget??Container()
            ],
          ),
        ),
      );
  }
}