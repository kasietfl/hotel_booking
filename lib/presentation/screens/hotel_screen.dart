import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:hotel_booking/data/models/hotel_model.dart';
import 'package:hotel_booking/presentation/bloc/hotel_bloc/hotel_bloc.dart';
import 'package:hotel_booking/presentation/screens/hotel_room.dart';
import 'package:hotel_booking/presentation/widgets/carousel_slider.dart';
import 'package:hotel_booking/presentation/widgets/custom_appbar.dart';
import 'package:hotel_booking/presentation/widgets/custom_button.dart';
import 'package:hotel_booking/presentation/widgets/peculiarities.dart';
import 'package:hotel_booking/presentation/widgets/rating_block.dart';
import 'package:hotel_booking/presentation/widgets/white_block.dart';
import 'package:hotel_booking/utils/colors.dart';
import 'package:hotel_booking/utils/price_format.dart';
import 'package:hotel_booking/utils/text_styles.dart';

class HotelScreen extends StatefulWidget {
  const HotelScreen({super.key});

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  Hotel? hotel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Отель',
      ),
      body: BlocConsumer<HotelBloc, HotelState>(listener: (context, state) {
        if (state is HotelError) {
          Fluttertoast.showToast(
              msg: state.error,
              toastLength: Toast.LENGTH_SHORT,
              backgroundColor: Colors.red,
              textColor: Colors.white);
        }
      }, builder: (context, state) {
        if (state is HotelLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is HotelLoaded) {
          hotel = state.hotel;
        }
        return SingleChildScrollView(
          child: Column(
            children: [
              WhiteBlock(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CarouselImageSlider(photoUrls: hotel?.imageUrls ?? []),
                    const SizedBox(height: 16),
                    RatingBlock(
                        rating: hotel?.rating, ratingName: hotel?.ratingName),
                    const SizedBox(height: 8),
                    Text(hotel?.name ?? "", style: textStyle22),
                    const SizedBox(height: 8),
                    Text(hotel?.adress ?? '',
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColors.lightBlue)),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Text('от ${formatPrice(hotel?.minimalPrice ?? 0)} ₽',
                            style: textStyle30),
                        const SizedBox(width: 8),
                        Text('за тур с перелётом',
                            style: textStyle16.copyWith(color: AppColors.grey))
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 8),
              WhiteBlock(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Об отеле', style: textStyle22),
                    const SizedBox(height: 16),
                    Peculiarities(
                        peculiarities: hotel != null
                            ? hotel!.aboutTheHotel.peculiarities
                            : []),
                    const SizedBox(height: 12),
                    Text(hotel?.aboutTheHotel.description ?? "",
                        style: textStyle16),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: AppColors.lightGrey,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: [
                          buildDetailContent('Удобства', 'happy_emoji'),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Divider(),
                          ),
                          buildDetailContent('Что включено', 'tick'),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Divider(),
                          ),
                          buildDetailContent('Что не включено', 'close')
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.only(
                    top: 12, left: 16, right: 16, bottom: 28),
                child: CustomButton(
                  title: 'К выбору номера',
                  onPress: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HotelRoom(title: hotel?.name))),
                ),
              )
            ],
          ),
        );
      }),
    );
  }

  Widget buildDetailContent(String title, String? icon) {
    return Row(
      children: [
        SvgPicture.asset('assets/svg/$icon.svg'),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: textStyle16.copyWith(
                    fontWeight: FontWeight.w500, color: AppColors.darkGrey)),
            const Text('Самое необходимое',
                style: TextStyle(
                    fontWeight: FontWeight.w500, color: AppColors.grey)),
          ],
        ),
        const Spacer(),
        const Icon(Icons.chevron_right_rounded, color: AppColors.darkGrey)
      ],
    );
  }
}
