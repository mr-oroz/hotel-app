import 'package:flutter/material.dart';
import 'package:hotel/presentation/models/get_hotel_list_model.dart';
import 'package:hotel/presentation/theme/app_fonts.dart';
import 'package:hotel/presentation/widgets/app_button/app_button.dart';
import 'package:hotel/presentation/widgets/app_button_outline/app_button_outline.dart';
import 'package:hotel/presentation/widgets/card_text_widget/card_text_widget.dart';
import 'package:hotel/presentation/widgets/custom_container/custom_container.dart';
import 'package:hotel/presentation/widgets/info_price_description_widget/info_price_description_widget.dart';
import 'package:hotel/presentation/widgets/swiper_widget/swiper_widget.dart';

class CardInfoHotelWidget extends StatelessWidget {
  const CardInfoHotelWidget({
    super.key,
    required this.item,
  });

  final Rooms item;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SwiperWidget(
            images: item.imageUrls,
          ),
          const SizedBox(height: 8),
          Text(
            '${item.name}',
            style: AppFonts.w500s22fSfPro,
          ),
          const SizedBox(height: 8),
          Wrap(
            runSpacing: 8,
            spacing: 8,
            children: item.peculiarities!.map((item) {
              return CardTextWidget(title: item);
            }).toList(),
            //],
          ),
          const SizedBox(height: 8),
          AppButtonOutline(
            title: 'Подробнее о номере',
            onPressed: () {},
          ),
          const SizedBox(height: 16),
          InfoPriceDesctiptionWidget(
              price: '${item.price}', description: '${item.pricePer}'),
          const SizedBox(height: 16),
          AppButton(
            onPressed: () {
              Navigator.pushNamed(context, '/reservation_screen');
            },
            title: 'Выбрать номер',
          ),
        ],
      ),
    );
  }
}
