import 'package:flutter/material.dart';
import 'package:hotel_booking/presentation/screens/hotel_room.dart';
import 'package:hotel_booking/presentation/widgets/custom_appbar.dart';
import 'package:hotel_booking/presentation/widgets/custom_button.dart';
import 'package:hotel_booking/utils/colors.dart';

class HotelScreen extends StatelessWidget {
  const HotelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> hotelPros = [
      '3-я линия',
      'Платный Wi-Fi в фойе',
      '30 км до аэропорта',
      '1 км до пляжа'
    ];

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Отель',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("slider with pics"),
                  const SizedBox(height: 8),
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
                        fontWeight: FontWeight.w500,
                        color: AppColors.lightBlue),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: const [
                      Text(
                        'от 134 673 ₽',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'за тур с перелётом',
                        style: TextStyle(fontSize: 16, color: AppColors.grey),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Об отеле',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: hotelPros.map((e) => buildHotelPros(e)).toList(),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: AppColors.lightGrey,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Удобства',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                                Text('Самое необходимое',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.grey)),
                              ],
                            ),
                            const Spacer(),
                            const Icon(Icons.arrow_forward_ios)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.only(
                  top: 12, left: 16, right: 16, bottom: 28),
              child: CustomButton(
                title: 'К выбору номера',
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HotelRoom()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildHotelPros(String text) {
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
