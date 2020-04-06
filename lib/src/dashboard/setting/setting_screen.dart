import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:health_care/animation/delayanimation.dart';
import 'package:health_care/src/dashboard/setting/setting_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
            ),
            DelayedAnimtion(
              delayDuration: delayedAnimation + 500,
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
                    ]),
                child: ValueListenableBuilder(
                    valueListenable:
                        Hive.box<SettingModel>('dbSetting').listenable(),
                    builder: (context, box, widget) {
                      SettingModel setting;
                      setting = box.getAt(0);
                      return Column(
                        children: <Widget>[
                          _buildItemProfile(
                            'Cho phép nhắc nhở',
                            Switch(
                              value: setting.acceptNoti,
                              onChanged: (val) {
                                setting.acceptNoti = !setting.acceptNoti;
                                box.putAt(0, setting);
                              },
                            ),
                            delayedAnimation + 800,
                          ),
                          InkWell(
                            onTap: () {
                              DatePicker.showTime12hPicker(context,
                                  showTitleActions: true, onChanged: (time) {
                                setting.timeWakeup = time.hour.toString() +
                                    ":" +
                                    time.minute.toString();
                              }, onConfirm: (time) {
                                setting.timeWakeup = time.hour.toString() +
                                    ":" +
                                    time.minute.toString();
                                  box.putAt(0, setting);
                              },
                              currentTime:DateTime.parse('20200602 063000Z'),
                              locale: LocaleType.vi);
                            },
                            child: _buildItemProfile(
                              'Giờ thức dậy',
                              Text(
                                setting.timeWakeup,
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
                                  showTitleActions: true, onChanged: (time) {
                                setting.timeSleep = time.hour.toString() +
                                    ":" +
                                    time.minute.toString();
                              }, onConfirm: (time) {
                                setting.timeSleep = time.hour.toString() +
                                    ":" +
                                    time.minute.toString();
                                  box.putAt(0, setting);
                              },
                              currentTime:DateTime.parse('20200602 233000Z'),
                              locale: LocaleType.vi);
                            },
                            child: _buildItemProfile(
                              'Giờ ngủ',
                              Text(
                                setting.timeSleep,
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
                              '1 giờ',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                              ),
                            ),
                            delayedAnimation + 1600,
                          ),
                        ],
                      );
                    }),
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
