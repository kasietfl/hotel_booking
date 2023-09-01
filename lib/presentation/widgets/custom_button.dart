import 'package:flutter/material.dart';
import 'package:hotel_booking/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function() onPress;

  const CustomButton({super.key, required this.title, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.lightBlue,
            ),
            onPressed: onPress,
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            )),
      ),
    );
  }
}
