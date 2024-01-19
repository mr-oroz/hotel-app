import 'package:flutter/material.dart';
import 'package:hotel/presentation/models/get_detail_model.dart';
import 'package:hotel/presentation/widgets/booking_item/booking_item.dart';
import 'package:hotel/presentation/widgets/custom_container/custom_container.dart';

class BookingDetailsCard extends StatelessWidget {
  const BookingDetailsCard({
    super.key,
    required this.data,
  });

  final GetDetailModel data;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: GridView.count(
        crossAxisCount: 1,
        childAspectRatio: 8,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          BookingItem(
            property: 'Вылет из',
            value: '${data.departure}',
          ),
          BookingItem(
            property: 'Страна, город',
            value: '${data.arrivalCountry}',
          ),
          BookingItem(
            property: 'Даты',
            value: '${data.tourDateStart} ${data.tourDateStop}',
          ),
          BookingItem(
            property: 'Кол-во ночей',
            value: '${data.numberOfNights} ночей',
          ),
          BookingItem(
            property: 'Отель',
            value: '${data.hotelName}',
          ),
          BookingItem(
            property: 'Номер',
            value: '${data.room}',
          ),
          BookingItem(
            property: 'Питание',
            value: '${data.nutrition}',
          ),
        ],
      ),
    );
  }
}


