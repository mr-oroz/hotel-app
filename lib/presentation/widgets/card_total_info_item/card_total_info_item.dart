import 'package:flutter/material.dart';
import 'package:hotel/presentation/theme/app_color.dart';
import 'package:hotel/presentation/theme/app_fonts.dart';

class CardTotalnfoItem extends StatelessWidget {
  const CardTotalnfoItem({
    super.key,
    required this.property,
    required this.value,
  });

  final String property;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            property,
            style: AppFonts.w400s16fSfPro.copyWith(
              color: AppColor.textGrey,
            ),
          ),
        ),
        Expanded(
          child: Text(
            "$value ₽",
            textAlign: TextAlign.end,
            style: property == 'К оплате'
                ? AppFonts.w600s16fSfPro.copyWith(color: AppColor.blue)
                : AppFonts.w400s16fSfPro.copyWith(color: AppColor.black),
          ),
        ),
      ],
    );
  }
}
