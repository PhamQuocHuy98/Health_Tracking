import 'package:flutter/material.dart';
import 'package:health_care/src/dashboard/setting/setting_screen.dart';
import 'package:health_care/src/dashboard/water/water_screen.dart';


class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int index = 0;

  List<Widget> listScreen = [
    WaterScreen(),
    SettingScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: (index) {
          setState(() {
            this.index = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
             Icons.home,
              color: index == 0 ? Colors.blue : Colors.black,
            ),
            title: Text(
              'Trang chủ',
              
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: index == 1 ? Colors.blue : Colors.black,
            ),
            title: Text(
              'Cài đặt',
              
            ),
          ),
        ],
      ),
      body: listScreen[index],
    );
  }
}
