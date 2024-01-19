import 'package:flutter/material.dart';
import 'package:hotel/presentation/theme/app_color.dart';
import 'package:hotel/presentation/theme/app_fonts.dart';

class BookingItem extends StatelessWidget {
  const BookingItem({
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
            value,
            style: AppFonts.w400s16fSfPro,
          ),
        ),
      ],
    );
  }
}