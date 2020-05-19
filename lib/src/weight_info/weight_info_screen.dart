import 'package:flutter/material.dart';
import 'package:health_care/animation/delayanimation.dart';
import 'package:health_care/base/bloc_base.dart';
import 'package:health_care/src/dashboard/setting/setting_bloc.dart';
import 'package:health_care/src/option/wake_up_info_screen.dart';
import 'package:health_care/utils/images.dart';
import 'package:health_care/widget/button.dart';
import 'package:numberpicker/numberpicker.dart';

class WeightInfoScreen extends StatefulWidget {
  final String imagePath;
  final Function weightNext;

  const WeightInfoScreen({
    Key key,
    this.imagePath,
    this.weightNext,
  }) : super(key: key);
  @override
  _WeightInfoState createState() => _WeightInfoState();
}

class _WeightInfoState extends State<WeightInfoScreen> {
  int delayAnimation = 500;
  int current_value = 50;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SettingBloc>(context);
    print(bloc.user.isMale);
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Container(
          child: Stack(
            // fit: StackFit.expand,
            children: [
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
                        'Cân nặng của bạn',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "muli",
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
                anioffsetX: 0.0,
                anioffsetY: 0.35,
                delayDuration: delayAnimation,
                aniDuration: 700,
              ),
              SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).viewPadding.top + 70,
                      ),
                      DelayedAnimtion(
                        anioffsetY: 1.00,
                        anioffsetX: 0.00,
                        delayDuration: delayAnimation + 200,
                        aniDuration: 700,
                        widget: Image.asset(widget.imagePath),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Đơn vị Kg',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      Center(
                        child: Container(
                          child: DelayedAnimtion(
                            anioffsetY: 1.00,
                            anioffsetX: 0.0,
                            delayDuration: delayAnimation + 400,
                            aniDuration: 700,
                            widget: Theme(
                              data: Theme.of(context).copyWith(
                                accentColor: Colors.white,
                              ),
                              child: NumberPicker.horizontal(
                                initialValue: current_value,
                                itemExtent: 70,
                                minValue: 10,
                                maxValue: 300,
                                onChanged: (vl) {
                                  if (current_value < 10 ||
                                      current_value > 300) {
                                    return;
                                  }
                                  setState(() {
                                    current_value = vl;
                                  });
                                  bloc.user.weight = current_value;
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: DelayedAnimtion(
                          anioffsetY: 1.00,
                          anioffsetX: 0.0,
                          delayDuration: delayAnimation + 600,
                          aniDuration: 700,
                          widget: CustomButton(
                            width: 300,
                            height: 60,
                            title: 'Tiếp tục',
                            color: Colors.white,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => WakeUpInfo(
                                            imagePath: Images.clock,
                                          )));
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Null> setWeightValue() async {}
}
