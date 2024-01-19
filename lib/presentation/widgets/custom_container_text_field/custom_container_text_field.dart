import 'package:flutter/material.dart';
import 'package:hotel/presentation/theme/app_color.dart';

class CustomContainerTextField extends StatelessWidget {
  const CustomContainerTextField({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        color: AppColor.colorInputBg,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: child,
    );
  }
}