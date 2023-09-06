import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/data/repository/hotel_repository.dart';
import 'package:hotel_booking/network/network_service.dart';
import 'package:hotel_booking/presentation/bloc/booking_bloc/booking_bloc.dart';
import 'package:hotel_booking/presentation/bloc/hotel_bloc/hotel_bloc.dart';
import 'package:hotel_booking/presentation/bloc/rooms_bloc/rooms_bloc.dart';
import 'package:hotel_booking/presentation/screens/hotel_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HotelBloc>(
            create: (context) => HotelBloc(
                repository: HotelRepository(restClient: RestClient(Dio())))
              ..add(GetHotelEvent())),
        BlocProvider<RoomsBloc>(
            create: (context) => RoomsBloc(
                repository: HotelRepository(restClient: RestClient(Dio())))),
        BlocProvider<BookingBloc>(
            create: (context) => BookingBloc(
                repository: HotelRepository(restClient: RestClient(Dio())))),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(fontFamily: 'SfProDisplay'),
        home: const HotelScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
