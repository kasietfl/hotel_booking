import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hotel_booking/data/models/booking_model.dart';
import 'package:hotel_booking/presentation/bloc/booking_bloc/booking_bloc.dart';
import 'package:hotel_booking/presentation/screens/paid_screen.dart';
import 'package:hotel_booking/presentation/widgets/custom_appbar.dart';
import 'package:hotel_booking/presentation/widgets/custom_button.dart';
import 'package:hotel_booking/presentation/widgets/custom_text_field.dart';
import 'package:hotel_booking/presentation/widgets/rating_block.dart';
import 'package:hotel_booking/presentation/widgets/white_block.dart';
import 'package:hotel_booking/utils/colors.dart';
import 'package:hotel_booking/utils/price_format.dart';
import 'package:hotel_booking/utils/text_styles.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class BookingRoom extends StatefulWidget {
  const BookingRoom({super.key});

  @override
  State<BookingRoom> createState() => _BookingRoomState();
}

class _BookingRoomState extends State<BookingRoom> {
  final formKey = GlobalKey<FormState>();
  Booking? bookingInfo;
  int? totalSum;

  @override
  void initState() {
    BlocProvider.of<BookingBloc>(context).add(GetBookingInfo());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: 'Бронирование',
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          )),
      body: BlocConsumer<BookingBloc, BookingState>(
        listener: (context, state) {
          if (state is BookingError) {
            Fluttertoast.showToast(
                msg: state.error,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                backgroundColor: Colors.red,
                textColor: Colors.white);
          }
        },
        builder: (context, state) {
          if (state is BookingLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is BookingLoaded) {
            bookingInfo = state.bookingInfo;
            totalSum = (bookingInfo?.tourPrice ?? 0) +
                (bookingInfo?.fuelCharge ?? 0) +
                (bookingInfo?.serviceCharge ?? 0);
          }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                WhiteBlock(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RatingBlock(
                          rating: bookingInfo?.horating,
                          ratingName: bookingInfo?.ratingName,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          bookingInfo?.hotelName ?? '',
                          style: textStyle22,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          bookingInfo?.hotelAdress ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColors.lightBlue),
                        ),
                        const SizedBox(height: 16),
                      ]),
                ),
                const SizedBox(height: 8),
                WhiteBlock(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildBookingDetails(
                          'Вылет из', bookingInfo?.departure ?? ''),
                      const SizedBox(height: 16),
                      buildBookingDetails(
                          'Страна, город', bookingInfo?.arrivalCountry ?? ''),
                      const SizedBox(height: 16),
                      buildBookingDetails('Даты',
                          '${bookingInfo?.tourDateStart} - ${bookingInfo?.tourDateStop}'),
                      const SizedBox(height: 16),
                      buildBookingDetails('Кол-во ночей',
                          '${bookingInfo?.numberOfNights ?? 0}'),
                      const SizedBox(height: 16),
                      buildBookingDetails(
                          'Отель', bookingInfo?.hotelName ?? ''),
                      const SizedBox(height: 16),
                      buildBookingDetails('Номер', bookingInfo?.room ?? ''),
                      const SizedBox(height: 16),
                      buildBookingDetails(
                          'Питание', bookingInfo?.nutrition ?? ''),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                buildCustomerInfo(),
                const SizedBox(height: 8),
                WhiteBlock(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        buildTourist(
                            'Первый турист ', Icons.expand_less_rounded),
                        const SizedBox(height: 20),
                        const CustomTextField(
                          hintText: 'Имя',
                        ),
                        const SizedBox(height: 8),
                        const CustomTextField(
                          hintText: 'Фамилия',
                        ),
                        const SizedBox(height: 8),
                        const CustomTextField(
                          hintText: 'Дата рождения',
                        ),
                        const SizedBox(height: 8),
                        const CustomTextField(
                          hintText: 'Гражданство',
                        ),
                        const SizedBox(height: 8),
                        const CustomTextField(
                          hintText: 'Номер загранпаспорта',
                        ),
                        const SizedBox(height: 8),
                        const CustomTextField(
                          hintText: 'Срок действия загранпаспорта',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                WhiteBlock(
                    child: buildTourist(
                        'Второй турист', Icons.expand_more_rounded)),
                const SizedBox(height: 8),
                WhiteBlock(child: buildTourist('Добавить туриста', Icons.add)),
                const SizedBox(height: 8),
                WhiteBlock(
                  child: Column(
                    children: [
                      buildPriceRow('Тур', bookingInfo?.tourPrice ?? 0),
                      const SizedBox(height: 16),
                      buildPriceRow(
                          'Топливный сбор', bookingInfo?.fuelCharge ?? 0),
                      const SizedBox(height: 16),
                      buildPriceRow(
                          'Сервисный сбор', bookingInfo?.serviceCharge ?? 0),
                      const SizedBox(height: 16),
                      buildPriceRow('К оплате', totalSum ?? 0, true),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 12, bottom: 28),
                  color: Colors.white,
                  child: CustomButton(
                      title: 'Оплатить ${formatPrice(totalSum ?? 0)} ₽',
                      onPress: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PaidScreen()));
                        }
                      }),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildBookingDetails(String title, String details) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: textStyle16.copyWith(color: AppColors.grey),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            details,
            style: textStyle16,
          ),
        )
      ],
    );
  }

  Widget buildTourist(String text, IconData icon) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: textStyle22),
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                  color: AppColors.lightBlue.withOpacity(.1),
                  borderRadius: BorderRadius.circular(6)),
              child: Icon(icon, color: AppColors.lightBlue),
            )
          ],
        )
      ],
    );
  }

  Widget buildCustomerInfo() {
    return WhiteBlock(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Информация о покупателе', style: textStyle22),
          const SizedBox(height: 20),
          CustomTextField(
            hintText: 'Номер телефона',
            inputFormatters: [
              MaskTextInputFormatter(
                  mask: '+7 (***) ***-**-**',
                  filter: {"*": RegExp(r'[0-9]')},
                  type: MaskAutoCompletionType.lazy)
            ],
            textInputType: TextInputType.phone,
          ),
          const SizedBox(height: 8),
          const CustomTextField(
            hintText: 'Почта',
            textInputType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 8),
          const Text(
              'Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту',
              style: TextStyle(color: AppColors.grey))
        ],
      ),
    );
  }

  Widget buildPriceRow(String label, int price, [bool isTotal = false]) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: textStyle16.copyWith(color: AppColors.grey),
        ),
        Text('${formatPrice(price)} ₽',
            style: textStyle16.copyWith(
                color: isTotal ? AppColors.lightBlue : Colors.black)),
      ],
    );
  }
}
