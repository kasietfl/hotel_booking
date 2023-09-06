import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel_booking/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final String? validatorText;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    super.key,
    this.hintText,
    this.textInputType,
    this.controller,
    this.inputFormatters,
    this.validatorText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          inputFormatters: inputFormatters,
          keyboardType: textInputType,
          validator: (value) {
            if (value!.isEmpty) {
              return "validatorText";
            } else if (textInputType == TextInputType.emailAddress &&
                !isEmailValid(value)) {
              return 'Введите корректную почту';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: hintText,
            label: Text(hintText ?? ""),
            labelStyle: const TextStyle(color: AppColors.labelColor),
            hintStyle: const TextStyle(color: AppColors.labelColor),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            border: InputBorder.none,
          ),
        ));
  }

  bool isEmailValid(String email) {
    final RegExp regex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
    );
    return regex.hasMatch(email);
  }
}
