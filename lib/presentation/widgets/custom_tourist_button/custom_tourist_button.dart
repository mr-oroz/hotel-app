import 'package:flutter/material.dart';
import 'package:hotel/presentation/theme/app_color.dart';

class CustomTouristButton extends StatelessWidget {
  const CustomTouristButton({
    super.key,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  final IconData icon;
  final Color color;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        child: Center(
          child: Icon(
            icon,
            color:
                color == AppColor.colorButOut ? AppColor.blue : AppColor.white,
            size: 22,
          ),
        ),
      ),
    );
  }
}
