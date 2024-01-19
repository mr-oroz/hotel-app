import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/presentation/bloc/app_bloc.dart';
import 'package:hotel/presentation/theme/app_color.dart';
import 'package:hotel/presentation/theme/app_fonts.dart';
import 'package:hotel/presentation/widgets/app_button/app_button.dart';
import 'package:hotel/presentation/widgets/booking_detail_cards/booking_detail_cards.dart';
import 'package:hotel/presentation/widgets/card_first_tourist/card_first_tourist.dart';
import 'package:hotel/presentation/widgets/card_total_info_widget/card_total_info_widget.dart';
import 'package:hotel/presentation/widgets/custom_container/custom_container.dart';
import 'package:hotel/presentation/widgets/custom_tourist_button/custom_tourist_button.dart';
import 'package:hotel/presentation/widgets/customer_information_widget/customer_information_widget.dart';
import 'package:hotel/presentation/widgets/rating_status_widget/rating_status_widget.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

const number = [
  'Третий',
  'Четвёртый',
  'Пятый',
  'Шестой',
  'Седьмой',
  'Восьмой',
  'Девятый'
];

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key});

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  List<Widget> touristCards = [
    const CardFirstTourist(numberTourist: 'Первый'),
    const CardFirstTourist(numberTourist: 'Второй'),
  ];
  @override
  void initState() {
    context.read<AppBloc>().add(GetDetailEvent());
    super.initState();
  }

  void addTourist() {
    if (touristCards.length < 9) {
      setState(() {
        String numberTourist = number[touristCards.length - 2];
        touristCards.add(CardFirstTourist(numberTourist: numberTourist));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Бронирование'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: BlocConsumer<AppBloc, AppState>(
            listener: (context, state) {
              if (state.errorCurrentData != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('error'),
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state.currentData == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state.currentData != null) {
                final data = state.currentData;
                return ListView(
                  children: [
                    CustomContainer(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RatingStatusWidget(
                              rating: '${data!.horating} ${data.ratingName}'),
                          const SizedBox(height: 8),
                          Text(
                            '${data.hotelName}',
                            style: AppFonts.w500s22fSfPro,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '${data.hotelAdress}',
                            style: AppFonts.w500s14fSfPro.copyWith(
                              color: AppColor.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    BookingDetailsCard(data: data),
                    const CustomerInformationWidget(),
                    ...touristCards,
                    if (touristCards.length <
                        9) // Показываем кнопку, если туристов меньше 9
                      CustomContainer(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Добавить туриста',
                              style: AppFonts.w500s22fSfPro,
                            ),
                            CustomTouristButton(
                              icon: Icons.add,
                              color: AppColor.blue,
                              onPressed:
                                  addTourist, // Добавляем туриста по нажатию
                            )
                          ],
                        ),
                      ),
                    CardTotalInfoWidget(data: data),
                    const SizedBox(height: 10),
                  ],
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        color: AppColor.white,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 25),
          child: AppButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pushNamed(context, '/order_paid_screen');
              }
            },
            title: 'Оплатить 198 036 ₽',
          ),
        ),
      ),
    );
  }
}
