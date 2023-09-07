import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel_booking/utils/colors.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    Key? key,
    this.hintText,
    this.textInputType,
    this.controller,
    this.inputFormatters,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isValid = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isValid
            ? AppColors.lightGrey
            : AppColors.errorColor.withOpacity(.15),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        inputFormatters: widget.inputFormatters,
        keyboardType: widget.textInputType,
        validator: (value) {
          if (value!.isEmpty) {
            setState(() {
              isValid = false;
            });
            return "Это поле не может быть пустым";
          } else if (widget.textInputType == TextInputType.emailAddress &&
              !validateEmail(value)) {
            setState(() {
              isValid = false;
            });
            return 'Введите корректную почту';
          } else {
            setState(() {
              isValid = true;
            });
          }

          return null;
        },
        decoration: InputDecoration(
          hintText: widget.hintText,
          label: Text(widget.hintText ?? ""),
          labelStyle: const TextStyle(color: Colors.grey),
          hintStyle: const TextStyle(color: Colors.grey),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          border: InputBorder.none,
        ),
      ),
    );
  }

  bool validateEmail(String email) => RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(email.trim());
}
