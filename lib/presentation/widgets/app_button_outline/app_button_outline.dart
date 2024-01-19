
import 'package:flutter/material.dart';
import 'package:hotel/presentation/theme/app_color.dart';
import 'package:hotel/presentation/theme/app_fonts.dart';

class AppButtonOutline extends StatelessWidget {
  const AppButtonOutline({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              color: AppColor.colorButOut,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: AppFonts.w500s16fSfPro.copyWith(
                    color: AppColor.blue,
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColor.blue,
                  size: 16,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}