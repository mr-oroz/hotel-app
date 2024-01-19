import 'package:flutter/material.dart';
import 'package:hotel/presentation/theme/app_color.dart';
import 'package:hotel/presentation/theme/app_fonts.dart';

class InfoPriceDesctiptionWidget extends StatelessWidget {
  const InfoPriceDesctiptionWidget({
    super.key,
    required this.price,
    required this.description,
  });

  final String price;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '$price ₽',
          style: AppFonts.w600s30fSfPro,
        ),
        const SizedBox(width: 8),
        Text(
          description.toLowerCase(),
          style: AppFonts.w400s16fSfPro.copyWith(
            color: AppColor.textGrey,
          ),
        ),
      ],
    );
  }
}