import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hotel_booking/presentation/widgets/custom_appbar.dart';
import 'package:hotel_booking/presentation/widgets/custom_button.dart';
import 'package:hotel_booking/utils/colors.dart';
import 'package:hotel_booking/utils/text_styles.dart';

class PaidScreen extends StatelessWidget {
  const PaidScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int bookingNumber = Random().nextInt(10000);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Заказ оплачен',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            const Image(image: AssetImage('assets/images/paid.png')),
            const SizedBox(height: 32),
            const Text(
              'Ваш заказ принят в работу',
              style: textStyle22,
            ),
            const SizedBox(height: 20),
            Text(
              'Подтверждение заказа №$bookingNumber может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.',
              style: textStyle16.copyWith(color: AppColors.grey),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            CustomButton(
                title: 'Супер!',
                onPress: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
                })
          ],
        ),
      ),
    );
  }
}
