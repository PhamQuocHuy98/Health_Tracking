import 'package:flutter/material.dart';
import 'package:health_care/animation/delayanimation.dart';
import 'package:health_care/src/weight_info/weight_info_screen.dart';
import 'package:health_care/utils/images.dart';
import 'package:health_care/widget/button.dart';


class MaleFemaleRadio extends StatefulWidget {
  final Function onTabFemale;
  final Function onTabMale;

  const MaleFemaleRadio({
    this.onTabFemale,
    this.onTabMale,
  });
  @override
  _MaleFemaleRadioState createState() => _MaleFemaleRadioState();
}

class _MaleFemaleRadioState extends State<MaleFemaleRadio> {
  
  int delayAnimation = 500;

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              DelayedAnimtion(
                widget: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).viewPadding.top + 20,
                      ),
                      Text(
                        "Giới tính của bạn",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "muli",
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
                anioffsetX: -1.35,
                anioffsetY: 0.00,
                delayDuration: delayAnimation,
                aniDuration: 700,
              ),
              Container(
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).viewPadding.top + 50,
                    ),
                    _buildGender('Nam',Images.boywithbottle,delayAnimation+200),
                    _buildGender('Nữ',Images.girlwithbottle,delayAnimation+500),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildGender(String title,String imgae,int delayAnimation){
    return DelayedAnimtion(
      anioffsetX: -1.35,
      anioffsetY: 0.00,
      delayDuration: delayAnimation ,
      aniDuration: 700,
      widget: Container(
        height: 320,
        width: 300,
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 100,
              backgroundColor: Colors.red,
              backgroundImage: AssetImage(
                imgae,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: CustomButton(
                width: 180,
                color: Colors.white,
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> WeightInfoScreen(
                    imagePath: Images.manWeight,
                  )));
                },
                title: title,
              )
            ),
          ],
        ),
      ),
    );
  }
}
