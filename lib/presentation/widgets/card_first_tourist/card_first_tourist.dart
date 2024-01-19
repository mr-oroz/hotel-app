import 'package:flutter/material.dart';
import 'package:hotel/presentation/theme/app_color.dart';
import 'package:hotel/presentation/theme/app_fonts.dart';
import 'package:hotel/presentation/widgets/custom_container/custom_container.dart';
import 'package:hotel/presentation/widgets/custom_text_field/custom_text_field.dart';
import 'package:hotel/presentation/widgets/custom_tourist_button/custom_tourist_button.dart';

class CardFirstTourist extends StatefulWidget {
  const CardFirstTourist({
    super.key,
    required this.numberTourist,
  });

  final String numberTourist;

  @override
  State<CardFirstTourist> createState() => _CardFirstTouristState();
}

class _CardFirstTouristState extends State<CardFirstTourist> {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController date = TextEditingController();
  final TextEditingController country = TextEditingController();
  final TextEditingController numberPassport = TextEditingController();
  final TextEditingController numberPeriodPass = TextEditingController();

  bool isOpen = false;

  void showList() {
    setState(() {
      isOpen = !isOpen;
    });
  }

  @override
  void initState() {
    setState(() {
      widget.numberTourist == 'Первый' ? isOpen = true : isOpen = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${widget.numberTourist} турист',
                style: AppFonts.w500s22fSfPro,
              ),
              CustomTouristButton(
                icon: isOpen
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: AppColor.colorDropBg,
                onPressed: showList,
              )
            ],
          ),
          const SizedBox(height: 20),
          isOpen
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      controller: firstName,
                      label: 'Имя',
                      value: '',
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      controller: lastName,
                      label: 'Фамилия',
                      value: '',
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      controller: date,
                      label: 'Дата рождения',
                      value: '',
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      controller: country,
                      label: 'Гражданство',
                      value: '',
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      controller: numberPassport,
                      label: 'Номер загранпаспорта',
                      value: '',
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      controller: numberPeriodPass,
                      label: 'Срок действия загранпаспорта',
                      value: '',
                    )
                  ],
                )
              : const SizedBox()
        ],
      ),
    );
  }
}


