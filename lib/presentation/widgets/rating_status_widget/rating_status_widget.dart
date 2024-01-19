import 'package:flutter/material.dart';
import 'package:hotel/presentation/theme/app_color.dart';
import 'package:hotel/presentation/theme/app_fonts.dart';

class RatingStatusWidget extends StatelessWidget {
  const RatingStatusWidget({
    super.key, required this.rating,
  });

  final String rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 149,
      height: 29,
      decoration: BoxDecoration(
          color: AppColor.yellow50,
          borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.star,
              size: 15,
              color: AppColor.yellow,
            ),
            Text(
              '5 Превосходно',
              style: AppFonts.w500s16fSfPro
                  .copyWith(color: AppColor.yellow),
            )
          ],
        ),
      ),
    );
  }
}