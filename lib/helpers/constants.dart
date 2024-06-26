
import 'package:transfer_flutter/pages/auth/loginUi.dart';
import 'package:transfer_flutter/pages/dashboard/dashboard_home.dart';
import 'package:transfer_flutter/pages/home/home_screen.dart';
import 'package:flutter/material.dart';

import '../pages/home/home_app_screen.dart';
import '../pages/user/user_grid.dart';
import '../pages/user/user_list.dart';

enum ResponsiveSizes{
  mobile,
  tablet,
  desktopWeb;

  // TODO: Add Logic
  static ResponsiveSizes whichDevice(){
    return ResponsiveSizes.mobile;
  }
}


class Sizes {
  static const imageHeight = 580.0;
  static const iconLarge = 128.0;
  static const iconMedium = 38.0;
  static const iconSmall = 32.0;
  static const badgeLargeSize = 20.0;
  static const listWidth = 320.0;
  static const verticalDividerWidth = 1.0;
}

class SelectedPage {
  static final List<Widget> bodySelectedPage = <Widget>[
    const UserList(),
    const UserGrid(),
    const DashboardHome(),
  ];

  static final List<Widget> bodySelectedPageSplitScreen = <Widget>[
          LoginPage(),
    const HomeAppScren(),
    const DashboardHome(),
  ];
}