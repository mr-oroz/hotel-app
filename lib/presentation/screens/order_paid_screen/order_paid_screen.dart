import 'package:flutter/material.dart';
import 'package:hotel/presentation/theme/app_color.dart';
import 'package:hotel/presentation/theme/app_fonts.dart';
import 'package:hotel/presentation/widgets/app_button/app_button.dart';
import 'package:hotel/resources/resources.dart';

class OrderPaidScreen extends StatelessWidget {
  const OrderPaidScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        title: const Text('Заказ оплачен'),
        leading: IconButton(
          splashRadius: 22,
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 94,
                  height: 94,
                  decoration: BoxDecoration(
                    color: AppColor.colorInputBg,
                    borderRadius: BorderRadius.circular(47),
                  ),
                  child: Center(
                    child: Image.asset(
                      AppImages.success,
                      width: 44,
                      height: 44,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Ваш заказ принят в работу',
                  style: AppFonts.w500s22fSfPro,
                ),
                const SizedBox(height: 32),
                Text(
                  'Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.',
                  textAlign: TextAlign.center,
                  style: AppFonts.w400s16fSfPro.copyWith(
                    color: AppColor.textGrey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        color: AppColor.white,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 25),
          child: AppButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/home_screen', (route) => false);
            },
            title: 'Супер!',
          ),
        ),
      ),
    );
  }
}
