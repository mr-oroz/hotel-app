import 'package:flutter/material.dart';

import 'package:hotel/presentation/theme/app_color.dart';
import 'package:hotel/presentation/theme/app_fonts.dart';

import 'package:hotel/presentation/widgets/custom_container/custom_container.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class CustomerInformationWidget extends StatefulWidget {
  const CustomerInformationWidget({
    super.key,
  });

  @override
  State<CustomerInformationWidget> createState() =>
      _CustomerInformationWidgetState();
}

class _CustomerInformationWidgetState extends State<CustomerInformationWidget> {
  final phone = MaskedTextController(mask: '+7 (900) 000-00-00');

  final TextEditingController email = TextEditingController();
  bool isEmailValid = true;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Информация о покупателе',
            style: AppFonts.w500s22fSfPro,
          ),
          const SizedBox(height: 20),
          CustomContainerTextField(
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Поле не должно быть пустым';
                }
                return null;
              },
              controller: phone,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Номер телефона',
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(borderSide: BorderSide.none),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          CustomContainerTextField(
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Поле не должно быть пустым';
                }
                return null;
              },
              controller: email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                focusColor: AppColor.textGrey,
                labelText: 'Почта',
                errorText: isEmailValid ? null : 'Некорректный Email',
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.error),
                ),
                focusedErrorBorder:
                    const OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                border: const OutlineInputBorder(borderSide: BorderSide.none),
                enabledBorder:
                    const OutlineInputBorder(borderSide: BorderSide.none),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  isEmailValid = _validateEmail(value);
                });
              },
              onEditingComplete: () {
                setState(() {
                  isEmailValid = _validateEmail(email.text);
                });
              },
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту',
            style: AppFonts.w400s14fSfPro.copyWith(
              color: AppColor.textGrey,
            ),
          )
        ],
      ),
    );
  }

  bool _validateEmail(String value) {
    Pattern pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = RegExp(pattern.toString());
    return regex.hasMatch(value) && value.isNotEmpty;
  }
}

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
