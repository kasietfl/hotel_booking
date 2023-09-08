import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:hotel_booking/data/models/rooms_model.dart';
import 'package:hotel_booking/presentation/bloc/rooms_bloc/rooms_bloc.dart';
import 'package:hotel_booking/presentation/screens/booking_room.dart';
import 'package:hotel_booking/presentation/widgets/carousel_slider.dart';
import 'package:hotel_booking/presentation/widgets/custom_appbar.dart';
import 'package:hotel_booking/presentation/widgets/custom_button.dart';
import 'package:hotel_booking/presentation/widgets/peculiarities.dart';
import 'package:hotel_booking/presentation/widgets/white_block.dart';
import 'package:hotel_booking/utils/colors.dart';
import 'package:hotel_booking/utils/price_format.dart';
import 'package:hotel_booking/utils/text_styles.dart';

class HotelRoom extends StatefulWidget {
  final String? title;
  const HotelRoom({super.key, this.title});

  @override
  State<HotelRoom> createState() => _HotelRoomState();
}

class _HotelRoomState extends State<HotelRoom> {
  List<Room>? rooms;

  @override
  void initState() {
    context.read<RoomsBloc>().add(GetRoomsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: widget.title ?? "",
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          )),
      body: BlocConsumer<RoomsBloc, RoomsState>(
        listener: (context, state) {
          if (state is RoomsError) {
            Fluttertoast.showToast(
                msg: state.error,
                toastLength: Toast.LENGTH_SHORT,
                backgroundColor: Colors.red,
                textColor: Colors.white);
          }
        },
        builder: (context, state) {
          if (state is RoomsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RoomsLoaded) {
            rooms = state.rooms.rooms;
          }
          return Column(
            children: [
              const SizedBox(height: 8),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) =>
                        buildRoomItem(context, rooms?[index]),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
                    itemCount: rooms?.length ?? 0),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildRoomItem(BuildContext context, Room? room) {
    return WhiteBlock(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselImageSlider(photoUrls: room?.imageUrls ?? []),
          const SizedBox(height: 8),
          Text(room?.name ?? '', style: textStyle22),
          const SizedBox(height: 8),
          Peculiarities(peculiarities: room != null ? room.peculiarities : []),
          const SizedBox(height: 8),
          buildMoreButton(),
          const SizedBox(height: 16),
          Row(
            children: [
              Text('${formatPrice(room?.price ?? 0)} ₽', style: textStyle30),
              const SizedBox(width: 8),
              Text(room?.pricePer ?? '',
                  style: textStyle16.copyWith(color: AppColors.grey))
            ],
          ),
          const SizedBox(height: 16),
          CustomButton(
            title: 'Выбрать номер',
            onPress: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const BookingRoom())),
          )
        ],
      ),
    );
  }

  Widget buildMoreButton() {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 2, top: 5, bottom: 5),
      decoration: BoxDecoration(
          color: AppColors.lightBlue.withOpacity(.1),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Подробнее о номере',
            style: textStyle16.copyWith(
                color: AppColors.lightBlue, fontWeight: FontWeight.w500),
          ),
          const Icon(
            Icons.chevron_right_rounded,
            color: AppColors.lightBlue,
          )
        ],
      ),
    );
  }
}
