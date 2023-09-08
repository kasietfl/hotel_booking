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
  final infoKey = GlobalKey<FormState>();
  final formKey = GlobalKey<FormState>();
  Booking? bookingInfo;
  int? totalSum;
  int touristCounter = 1;

  List<CounterTitles> counterTitles = [
    CounterTitles(title: 'Первый', isVisible: true),
    CounterTitles(title: 'Второй'),
    CounterTitles(title: 'Третий'),
    CounterTitles(title: 'Четвертый')
  ];

  @override
  void initState() {
    context.read<BookingBloc>().add(GetBookingInfo());
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
                        )
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
                ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: touristCounter,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      return WhiteBlock(
                        child: Column(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    for (var element in counterTitles) {
                                      element.isVisible = false;
                                    }
                                    counterTitles[index].isVisible = true;
                                  });
                                },
                                child: buildTourist(
                                    text:
                                        '${counterTitles[index].title} турист ',
                                    isExpanded: counterTitles[index].isVisible,
                                    isAdd: false)),
                            Visibility(
                                visible: counterTitles[index].isVisible,
                                child: buildForm())
                          ],
                        ),
                      );
                    }),
                const SizedBox(height: 8),
                WhiteBlock(
                    child: GestureDetector(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        for (var element in counterTitles) {
                          element.isVisible = false;
                        }
                        touristCounter++;
                      });
                    }
                  },
                  child: buildTourist(
                      text: 'Добавить туриста', isExpanded: false, isAdd: true),
                )),
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
                        bool isValidForm1 = infoKey.currentState!.validate();
                        bool isValidForm2 = formKey.currentState!.validate();
                        if (isValidForm1 && isValidForm2) {
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

  Widget buildCustomerInfo() {
    return WhiteBlock(
      child: Form(
        key: infoKey,
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
      ),
    );
  }

  Widget buildTourist(
      {required String text, required bool isExpanded, required bool isAdd}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: textStyle22),
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: isAdd
                ? AppColors.lightBlue
                : AppColors.lightBlue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(
            isAdd
                ? Icons.add
                : (isExpanded
                    ? Icons.expand_less_rounded
                    : Icons.expand_more_rounded),
            color: isAdd ? Colors.white : AppColors.lightBlue,
          ),
        ),
      ],
    );
  }

  Widget buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: const [
          SizedBox(height: 20),
          CustomTextField(
            hintText: 'Имя',
          ),
          SizedBox(height: 8),
          CustomTextField(
            hintText: 'Фамилия',
          ),
          SizedBox(height: 8),
          CustomTextField(
            hintText: 'Дата рождения',
          ),
          SizedBox(height: 8),
          CustomTextField(
            hintText: 'Гражданство',
          ),
          SizedBox(height: 8),
          CustomTextField(
            hintText: 'Номер загранпаспорта',
          ),
          SizedBox(height: 8),
          CustomTextField(
            hintText: 'Срок действия загранпаспорта',
          ),
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
                color: isTotal ? AppColors.lightBlue : Colors.black,
                fontWeight: isTotal ? FontWeight.w600 : FontWeight.w400)),
      ],
    );
  }
}

class CounterTitles {
  final String title;
  bool isVisible;

  CounterTitles({required this.title, this.isVisible = false});
}
