import 'package:flutter/material.dart';
import 'package:hotel/presentation/theme/app_color.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    required this.value,
    required this.controller,
  });

  final String label;
  final String value;
  final TextEditingController controller;

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
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Поле не должно быть пустым';
          }
          return null;
        },
        controller: controller,
        decoration: InputDecoration(
          focusColor: AppColor.textGrey,
          labelText: label,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
