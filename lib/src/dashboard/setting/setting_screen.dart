import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:health_care/animation/delayanimation.dart';
import 'package:health_care/base/bloc_base.dart';
import 'package:health_care/src/dashboard/setting/setting_bloc.dart';
import 'package:health_care/utils/helper.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final int delayedAnimation = 500;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  SettingBloc bloc;
  @override
  Widget build(BuildContext context) {
    print('ReBUILd');
    bloc = BlocProvider.of<SettingBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cài đặt uống nước'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                left: 10,
                top: 10,
              ),
              child: Row(
                children: <Widget>[
                  _buildDot(),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Cài đặc nhắc nhở'),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 20),
              padding: EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 2.0,
                    ),
                  ]),
              child: Column(
                children: <Widget>[
                  _buildItemProfile(
                    'Cho phép nhắc nhở',
                    Switch(
                      value: bloc.user.enableNoti,
                      onChanged: (val) {
                        setState(() {
                          bloc.user.enableNoti = val;
                        });
                      },
                    ),
                    delayedAnimation + 800,
                  ),
                  InkWell(
                    onTap: () {
                      DatePicker.showTime12hPicker(context,
                          showTitleActions: true,
                          onChanged: (time) {}, 
                          onConfirm: (time) {
                        setState(() {
                          bloc.user.timeWakeup = time.toString();
                        });
                      },
                          currentTime: DateTime.parse(bloc.user.timeWakeup),
                          locale: LocaleType.vi);
                    },
                    child: _buildItemProfile(
                      'Giờ thức dậy',
                      Text(
                        bloc.user.timeWakeup.toString().toFormatTime(),
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                        ),
                      ),
                      delayedAnimation + 1200,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      DatePicker.showTime12hPicker(context,
                          showTitleActions: true,
                          onChanged: (time) {},
                          onConfirm: (time) {
                            setState(() {
                              bloc.user.timeSleep=time.toString();
                            });
                          },
                          currentTime: DateTime.parse(bloc.user.timeSleep),
                          locale: LocaleType.vi);
                    },
                    child: _buildItemProfile(
                      'Giờ ngủ',
                      Text(
                        bloc.user.timeSleep.toLowerCase(),
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                        ),
                      ),
                      delayedAnimation + 1400,
                    ),
                  ),
                  _buildItemProfile(
                    'Khoảng thời gian nhắc nhở',
                    Text(
                      bloc.user.target.toString() + " giờ",
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
            DelayedAnimtion(
              delayDuration: delayedAnimation + 1800,
              anioffsetX: 0.35,
              anioffsetY: 0.35,
              aniDuration: 700,
              widget: Container(
                margin: EdgeInsets.only(
                  left: 10,
                  top: 10,
                ),
                child: Row(
                  children: <Widget>[
                    _buildDot(),
                    SizedBox(
                      width: 10,
                    ),
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
                margin: EdgeInsets.only(left: 10, right: 10, top: 20),
                padding: EdgeInsets.only(top: 10, bottom: 10),
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
                      'M��c tiêu hằng ngày',
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

  Widget _buildDot({Color color = Colors.blue}) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }

  Widget _buildItemProfile(String title, Widget widget, int delay,
      {Color color = Colors.transparent}) {
    return DelayedAnimtion(
      delayDuration: delay,
      anioffsetX: 0.0,
      anioffsetY: 0.35,
      aniDuration: 700,
      widget: Container(
        color: color,
        height: 50,
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[Text(title), widget ?? Container()],
        ),
      ),
    );
  }
}
