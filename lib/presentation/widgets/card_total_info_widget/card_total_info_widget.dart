import 'package:flutter/material.dart';
import 'package:hotel/presentation/models/get_detail_model.dart';
import 'package:hotel/presentation/widgets/card_total_info_item/card_total_info_item.dart';
import 'package:hotel/presentation/widgets/custom_container/custom_container.dart';

class CardTotalInfoWidget extends StatelessWidget {
  const CardTotalInfoWidget({
    super.key,
    required this.data,
  });

  final GetDetailModel data;

  @override
  Widget build(BuildContext context) {
    final int total = (data.tourPrice ?? 0) +
        (data.fuelCharge ?? 0) +
        (data.serviceCharge ?? 0);

    return CustomContainer(
      child: GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 1,
          childAspectRatio: 8,
          children: [
            CardTotalnfoItem(
              property: 'Тур',
              value: '${data.tourPrice}',
            ),
            CardTotalnfoItem(
              property: 'Топливный сбор',
              value: '${data.fuelCharge}',
            ),
            CardTotalnfoItem(
              property: 'Сервисный сбор',
              value: '${data.serviceCharge}',
            ),
            CardTotalnfoItem(
              property: 'К оплате',
              value: '$total',
            ),
          ]),
    );
  }
}

