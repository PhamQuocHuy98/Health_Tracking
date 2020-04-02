import 'package:flutter/material.dart';
import 'package:health_care/utils/images.dart';
import 'package:percent_indicator/percent_indicator.dart';

class WaterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Uống nước'),
        elevation: 0,
        leading: Icon(Icons.menu),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Icon(Icons.notifications))
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top:50),
        child:Column(
          children: <Widget>[
            CircularPercentIndicator(
                radius: 200.0,
                lineWidth: 10.0,
                percent: 0.37,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('800/2145 ml'),
                    Text('Mục tiêu hằng ngày'),
                  ],
                ),
                backgroundColor: Colors.grey,
                progressColor: Colors.blue,
              ),
              SizedBox(height:30),
              Text('Tuỳ chỉnh ml cốc nước'),
              Image.asset(
                Images.cup,
                width: 50,
                height: 50,
              ),
              Text('200 ml')
          ],
        )
      ),
    );
  }
}