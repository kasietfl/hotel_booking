import 'package:flutter/material.dart';
import 'package:hotel_booking/presentation/screens/paid.dart';
import 'package:hotel_booking/presentation/widgets/custom_appbar.dart';
import 'package:hotel_booking/presentation/widgets/custom_button.dart';
import 'package:hotel_booking/utils/colors.dart';

class BookingRoom extends StatelessWidget {
  const BookingRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Бронирование',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: AppColors.yellow.withOpacity(.2),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.star,
                      color: AppColors.yellow,
                    ),
                    Text(
                      '5 Превосходно',
                      style: TextStyle(
                          color: AppColors.yellow,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Steigenberger Makadi',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              const Text(
                'Madinat Makadi, Safaga Road, Makadi Bay, Египет',
                style: TextStyle(
                    fontWeight: FontWeight.w500, color: AppColors.lightBlue),
              ),
              const SizedBox(height: 16),
            ]),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              buildBookingDetails(),
              const SizedBox(height: 16),
              buildBookingDetails(),
              const SizedBox(height: 16),
              buildBookingDetails(),
              const SizedBox(height: 16),
              buildBookingDetails()
            ]),
          ),
          CustomButton(
              title: 'Оплатить 198 036 ₽',
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PaidScreen()));
              })
        ],
      ),
    );
  }

  Widget buildBookingDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        Expanded(
          flex: 2,
          child: Text(
            'data',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            'data',
            style: TextStyle(fontSize: 16),
          ),
        )
      ],
    );
  }
}
