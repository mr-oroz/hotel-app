import 'package:flutter/material.dart';
import 'package:hotel/presentation/theme/app_color.dart';
import 'package:hotel/presentation/theme/app_fonts.dart';

class CustomCardInformation extends StatelessWidget {
  const CustomCardInformation({
    super.key,
    required this.label,
    this.title,
  });

  final String label;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: title != null ? 10 : 16,
      ),
      decoration: BoxDecoration(
        color: AppColor.colorInputBg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: title != null
                ? AppFonts.w400s12fSfPro.copyWith(
                    color: AppColor.textGrey,
                  )
                : AppFonts.w400s17fSfPro.copyWith(
                    color: AppColor.textGrey,
                  ),
          ),
          if (title != null)
            Text(
              title.toString(),
              style: AppFonts.w400s16fSfPro,
            )
        ],
      ),
    );
  }
}
