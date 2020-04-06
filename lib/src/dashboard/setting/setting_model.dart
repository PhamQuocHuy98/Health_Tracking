

import 'package:hive/hive.dart';
part 'setting_model.g.dart';
@HiveType()
class SettingModel {

  @HiveField(0)
  bool acceptNoti;


  @HiveField(1)
  bool acceptNotiWhenComplete;

  @HiveField(2)
  String timeWakeup;

  @HiveField(3)
  String timeSleep;

  @HiveField(4)
  String target;

  @HiveField(5)
  int mlInDay;

  SettingModel(this.acceptNoti,this.acceptNotiWhenComplete,this.timeWakeup,this.timeSleep,this.mlInDay);

}