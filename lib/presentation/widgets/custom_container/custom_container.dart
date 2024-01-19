import 'package:flutter/material.dart';
import 'package:hotel/presentation/theme/app_color.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
          color: AppColor.white, borderRadius: BorderRadius.circular(15)),
      child: child,
    );
  }
}