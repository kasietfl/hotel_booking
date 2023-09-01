import 'package:flutter/material.dart';
import 'package:hotel_booking/presentation/screens/booking_room.dart';
import 'package:hotel_booking/presentation/widgets/custom_appbar.dart';
import 'package:hotel_booking/presentation/widgets/custom_button.dart';
import 'package:hotel_booking/utils/colors.dart';

class HotelRoom extends StatelessWidget {
  const HotelRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Steigenberger Makadi',
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          buildRoomItem(context),
          const SizedBox(
            height: 8,
          ),
          buildRoomItem(context)
        ],
      )),
    );
  }

  Widget buildRoomItem(context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Стандартный с видом на бассейн или сад',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                color: AppColors.lightBlue.withOpacity(.1),
                borderRadius: BorderRadius.circular(5)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Подробнее о номере',
                  style: TextStyle(
                      color: AppColors.lightBlue,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.lightBlue,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: const [
              Text(
                '186 600 ₽',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              SizedBox(width: 8),
              Text(
                'за 7 ночей с перелётом',
                style: TextStyle(fontSize: 16, color: AppColors.grey),
              )
            ],
          ),
          const SizedBox(height: 16),
          CustomButton(
            title: 'Выбрать номер',
            onPress: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const BookingRoom()));
            },
          )
        ],
      ),
    );
  }
}
