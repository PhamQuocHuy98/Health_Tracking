import 'dart:convert';

import 'package:health_care/base/bloc_base.dart';
import 'package:health_care/base/user_preferences.dart';
import 'package:health_care/model/user.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingBloc extends BlocBase {
  User user;

  /*BehaviorSubject<bool> _hasUpdate = BehaviorSubject<bool>.seeded(false);

  Stream<bool> get hasUpdate => _hasUpdate.stream;

  onChangeState() {
    _hasUpdate.sink.add(true);
  }*/

  SettingBloc() {
    initUser();
  }

  initUser() async {
    var token = await UserPreferences().getTokenUser();
    user = User.init(
      enableNoti: false,
      height: 165,
      name: "",
      target: 1,
      timeNoti: "1",
      timeSleep: "23:00",
      timeWakeup: "07:00",
      token: "",
      weight: 65,
      isMale: true,
    );

    print(user);
    print(json.encode(user));
    if (token == '') {
      user = User.init(
        enableNoti: false,
        height: 165,
        name: "",
        target: 1,
        timeNoti: "1",
        timeSleep: "23:00",
        timeWakeup: "07:00",
        token: "",
        weight: 65,
        isMale: true,
      );
      saveUserToPref();
    } else {
      String temp = await UserPreferences().getUser();
      print('DEBUG USER TEMP');
      print(temp);

      user = User.fromJson(json.decode(temp));
      print(user.name);
      //saveUserToPref();
    }
  }

  void saveUserToPref() {
    UserPreferences().setUser(json.encode(user));
  }

  @override
  void dispose() {
    //_hasUpdate?.close();
  }
}
