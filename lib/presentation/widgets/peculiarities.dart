import 'package:flutter/material.dart';
import 'package:hotel_booking/utils/colors.dart';

class Peculiarities extends StatelessWidget {
  final List<String> peculiarities;
  const Peculiarities({super.key, required this.peculiarities});

  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 8,
        runSpacing: 8,
        children: peculiarities.map((e) => buildPeculiarities(e)).toList());
  }

  Widget buildPeculiarities(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: AppColors.lightGrey, borderRadius: BorderRadius.circular(5)),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.grey),
      ),
    );
  }
}
