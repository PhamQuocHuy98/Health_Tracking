import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:health_care/animation/delayanimation.dart';
import 'package:health_care/base/bloc_base.dart';
import 'package:health_care/src/dashboard/setting/setting_bloc.dart';
import 'package:health_care/src/dashboard/setting/setting_model.dart';
import 'package:health_care/src/option/done_screen.dart';
import 'package:health_care/widget/button.dart';
import 'package:hive/hive.dart';

class WakeUpInfo extends StatefulWidget {
  final Function next;
  final String imagePath;
  static DateTime time;

  const WakeUpInfo({Key key, this.next, this.imagePath}) : super(key: key);
  @override
  _WakeUpInfoState createState() => _WakeUpInfoState();
}

class _WakeUpInfoState extends State<WakeUpInfo> {
  int delayAnimation = 500;
  DateTime timeWakeup = DateTime.parse('20200600 06:30:00Z');
  DateTime timeSleep = DateTime.parse('20200600 23:30:00Z');

  SettingBloc bloc;
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SettingBloc>(context);
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Container(
          child: Column(
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
                        "Thời gian thức dậy",
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
              DelayedAnimtion(
                anioffsetY: 1.00,
                anioffsetX: 0.00,
                delayDuration: delayAnimation + 200,
                aniDuration: 700,
                widget: Image.asset(
                  widget.imagePath,
                  height: 300,
                ),
              ),
              DelayedAnimtion(
                anioffsetY: 1.00,
                anioffsetX: 0.00,
                delayDuration: delayAnimation + 500,
                aniDuration: 700,
                widget: Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Text(
                    'Thức dậy & Đi ngủ',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: "muli",
                        fontSize: 17),
                  ),
                ),
              ),
              SizedBox(height: 40),
              DelayedAnimtion(
                anioffsetY: 1.00,
                anioffsetX: 0.00,
                delayDuration: delayAnimation + 800,
                aniDuration: 700,
                widget: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      child: _buildText(timeWakeup.hour.toString() +
                          ":" +
                          timeWakeup.minute.toString() +
                          " AM"),
                      onTap: () {
                        DatePicker.showTime12hPicker(context,
                            showTitleActions: true, onChanged: (time) {
                          setState(() {
                            timeWakeup = time;
                          });
                        }, onConfirm: (time) {
                          setState(() {
                            timeWakeup = time;
                          });
                        }, currentTime: timeWakeup, locale: LocaleType.vi);
                      },
                    ),
                    _buildText(' - '),
                    InkWell(
                      child: _buildText(timeSleep.hour.toString() +
                          ":" +
                          timeWakeup.minute.toString() +
                          " PM"),
                      onTap: () {
                        DatePicker.showTime12hPicker(context,
                            showTitleActions: true, onChanged: (time) {
                          setState(() {
                            timeSleep = time;
                          });
                        }, onConfirm: (time) {
                          setState(() {
                            timeSleep = time;
                          });
                        }, currentTime: timeSleep, locale: LocaleType.vi);
                      },
                    ),
                  ],
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
                  delayDuration: delayAnimation + 1000,
                  aniDuration: 700,
                  widget: CustomButton(
                    width: 300,
                    height: 60,
                    title: 'Tiếp tục',
                    color: Colors.white,
                    onTap: () {
                      bloc.user.timeWakeup = timeWakeup.toString();
                      bloc.user.timeSleep = timeSleep.toString();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DoneNotifiScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildText(String text) {
    return Text(
      text ?? '',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontFamily: "muli",
        fontSize: 27,
      ),
    );
  }
}
