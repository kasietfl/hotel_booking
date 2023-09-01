import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    Key? key,
    String? title,
    List<Widget>? actions,
    String? popToAction,
    PreferredSizeWidget? bottom,
    BuildContext? context,
    Widget? leading,
    double? elevation,
  }) : super(
            key: key,
            leading: leading,
            elevation: 0,
            title: buildTitle(title),
            backgroundColor: Colors.white,
            bottom: bottom,
            iconTheme: const IconThemeData(color: Colors.black),
            centerTitle: true);

  static Widget buildTitle(String? title) {
    return Text(
      title!,
      style: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
    );
  }
}
