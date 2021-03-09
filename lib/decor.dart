import 'package:flutter/material.dart';

class AppColor {
  static Color primary   = Color.fromARGB(255, 9, 208, 176);
  static Color primary90 = Color.fromARGB(230, 9, 208, 176);
  static Color primary80 = Color.fromARGB(204, 9, 208, 176);
  static Color primary75 = Color.fromARGB(192, 9, 208, 176);
  static Color primary70 = Color.fromARGB(178, 9, 208, 176);
  static Color primary60 = Color.fromARGB(153, 9, 208, 176);
  static Color primary50 = Color.fromARGB(128, 9, 208, 176);
  static Color primary40 = Color.fromARGB(102, 9, 208, 176);
  static Color primary30 = Color.fromARGB (76, 9, 208, 176);
  static Color primary25 = Color.fromARGB (64, 9, 208, 176);
  static Color primary20 = Color.fromARGB (51, 9, 208, 176);
  static Color primary10 = Color.fromARGB (25, 9, 208, 176);

  static Color primaryLight   = Color.fromARGB(255, 2, 207, 232);
  static Color primaryLight90 = Color.fromARGB(230, 2, 207, 232);
  static Color primaryLight80 = Color.fromARGB(204, 2, 207, 232);
  static Color primaryLight75 = Color.fromARGB(192, 2, 207, 232);
  static Color primaryLight70 = Color.fromARGB(178, 2, 207, 232);
  static Color primaryLight60 = Color.fromARGB(153, 2, 207, 232);
  static Color primaryLight50 = Color.fromARGB(128, 2, 207, 232);
  static Color primaryLight40 = Color.fromARGB(102, 2, 207, 232);
  static Color primaryLight30 = Color.fromARGB (76, 2, 207, 232);
  static Color primaryLight25 = Color.fromARGB (64, 2, 207, 232);
  static Color primaryLight20 = Color.fromARGB (51, 2, 207, 232);
  static Color primaryLight10 = Color.fromARGB (25, 2, 207, 232);

  static Color primaryDark   = Color.fromARGB(255, 0, 144, 112);
  static Color primaryDark90 = Color.fromARGB(230, 0, 144, 112);
  static Color primaryDark80 = Color.fromARGB(204, 0, 144, 112);
  static Color primaryDark75 = Color.fromARGB(192, 0, 144, 112);
  static Color primaryDark70 = Color.fromARGB(178, 0, 144, 112);
  static Color primaryDark60 = Color.fromARGB(153, 0, 144, 112);
  static Color primaryDark50 = Color.fromARGB(128, 0, 144, 112);
  static Color primaryDark40 = Color.fromARGB(102, 0, 144, 112);
  static Color primaryDark30 = Color.fromARGB (76, 0, 144, 112);
  static Color primaryDark25 = Color.fromARGB (64, 0, 144, 112);
  static Color primaryDark20 = Color.fromARGB (51, 0, 144, 112);
  static Color primaryDark10 = Color.fromARGB (25, 0, 144, 112);

  static Color primary1Comp   = Color.fromARGB(255, 108, 29, 209);
  static Color primary1Comp90 = Color.fromARGB(230, 108, 29, 209);
  static Color primary1Comp80 = Color.fromARGB(204, 108, 29, 209);
  static Color primary1Comp75 = Color.fromARGB(192, 108, 29, 209);
  static Color primary1Comp70 = Color.fromARGB(178, 108, 29, 209);
  static Color primary1Comp60 = Color.fromARGB(153, 108, 29, 209);
  static Color primary1Comp50 = Color.fromARGB(128, 108, 29, 209);
  static Color primary1Comp40 = Color.fromARGB(102, 108, 29, 209);
  static Color primary1Comp30 = Color.fromARGB (76, 108, 29, 209);
  static Color primary1Comp25 = Color.fromARGB (64, 108, 29, 209);
  static Color primary1Comp20 = Color.fromARGB (51, 108, 29, 209);
  static Color primary1Comp10 = Color.fromARGB (25, 108, 29, 209);

  static Color primary2Comp   = Color.fromARGB(255, 22, 108, 158);
  static Color primary2Comp90 = Color.fromARGB(230, 22, 108, 158);
  static Color primary2Comp80 = Color.fromARGB(204, 22, 108, 158);
  static Color primary2Comp75 = Color.fromARGB(192, 22, 108, 158);
  static Color primary2Comp70 = Color.fromARGB(178, 22, 108, 158);
  static Color primary2Comp60 = Color.fromARGB(153, 22, 108, 158);
  static Color primary2Comp50 = Color.fromARGB(128, 22, 108, 158);
  static Color primary2Comp40 = Color.fromARGB(102, 22, 108, 158);
  static Color primary2Comp30 = Color.fromARGB (76, 22, 108, 158);
  static Color primary2Comp25 = Color.fromARGB (64, 22, 108, 158);
  static Color primary2Comp20 = Color.fromARGB (51, 22, 108, 158);
  static Color primary2Comp10 = Color.fromARGB (25, 22, 108, 158);
}

class CustomShapeClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(
        size.width - size.width / 4, size.height, size.width, size.height - 20);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}