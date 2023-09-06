import 'package:flutter/material.dart';
import 'package:hotel_booking/utils/text_styles.dart';

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
    return Text(title!, style: textStyle18);
  }
}
