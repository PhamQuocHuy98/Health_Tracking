import 'package:flutter/material.dart';
import 'package:health_care/src/dashboard/water/water_model.dart';
import 'package:health_care/utils/images.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:percent_indicator/percent_indicator.dart';

class WaterScreen extends StatefulWidget {

  @override
  _WaterScreenState createState() => _WaterScreenState();
}

class _WaterScreenState extends State<WaterScreen> {
  
  @override
  void initState() {
    // TODO: implement initState
   
    // bloc.getALl();
    super.initState();
  }

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
      body: SingleChildScrollView(
          child: Container(
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
            _buildChangeCup(),
            SizedBox(height:30),
            Text('Uống'),
            InkWell(
              onTap: (){
                Water water = Water(
                  DateTime.now().hour.toString()+"h "+ DateTime.now().minute.toString(),200,
                );
                Hive.box<Water>('dbWater')..add(water);
               
              },
              child: Image.asset(
                Images.cup,
                width: 50,
                height: 50,
              ),
            ),
            Text('200 ml'),
            Container(
              margin: EdgeInsets.only(left: 10,top:20),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                        color: Colors.blue
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text('Nhật ký ngày hôm nay'),
                    alignment: Alignment.centerLeft,
                  ),
                ],
              ),
            ),
            _buildHistory(),
          ],
            )
        ),
      ),
    );
  }

  Widget _buildChangeCup(){
    return GestureDetector(
      onTap: (){},
        child: Container(
       // width: 100,
       margin: EdgeInsets.only(top:30),
        padding: EdgeInsets.only(top:10,bottom: 10,left: 20,right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.grey[500],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(Icons.replay),
            Text('Đổi cup')
          ],
        ),
      ),
    );
  }

  Widget _buildHistory(){
   return Container(
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
      child:ValueListenableBuilder(
      valueListenable: Hive.box<Water>('dbWater').listenable(),
      builder: (context,Box<Water> box,widget){
        if (box.values.isEmpty)
          return Center(
            child: Text("No contacts"),
        );
        return Column(
          children: List.generate(box.length, (index){
            return Column(
                children: <Widget>[
                  _buildItemHistory(box.getAt(index),index),
                  index<box.length-1?Divider(height: 1,):Container(),
                ],
              );
          }),
        );
      }
      ),
    );
    
  }

  Widget _buildItemHistory(Water water,int index){
    return Container(
      margin: EdgeInsets.only(top: 10,bottom: 10),
      child: Row(
        children: <Widget>[
          
          SizedBox(width: 10,),
          Icon(Icons.access_time,color: Colors.blue,),
          SizedBox(width: 10,),
          Text(water.time??''),
          Spacer(),
          Image.asset(
            Images.cup,
            width: 30,
            height: 30,
          ),
          Text(water.ml.toString()??''),
          SizedBox(width: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right:10),
                child: Icon(Icons.edit),
              ),
               InkWell(
                  onTap: (){
                    Hive.box<Water>('dbWater')..deleteAt(index);
                  },
                  child: Container(
                  margin: EdgeInsets.only(right:20,left: 10),
                  child: Icon(Icons.delete,color: Colors.red,),
              ),
               ),
              
            ],
          )
          

        ],
      ),
    );
  }
}