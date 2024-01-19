import 'package:flutter/material.dart';
import 'package:hotel/presentation/screens/home_screen/home_screen.dart';
import 'package:hotel/presentation/screens/order_paid_screen/order_paid_screen.dart';
import 'package:hotel/presentation/screens/reservation_screen/reservation_screen.dart';
import 'package:hotel/presentation/screens/selection_screen/selection_screen.dart';
import 'package:hotel/presentation/theme/app_color.dart';
import 'package:hotel/presentation/theme/app_fonts.dart';
import 'package:hotel/presentation/utils/providers/app_bloc_provider.dart';
import 'package:hotel/presentation/utils/providers/app_repo_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final repositoryProviders = buildAppProviders(
      buildAppBlocProviders(
        context,
        MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: AppColor.blue,
            inputDecorationTheme: const InputDecorationTheme(
              labelStyle: TextStyle(color: AppColor.textGrey),
            ),
            appBarTheme: AppBarTheme(
                elevation: 0,
                backgroundColor: Colors.white,
                centerTitle: true,
                titleTextStyle: AppFonts.w500s18fSfPro.copyWith(
                  color: AppColor.black,
                ),
                iconTheme: const IconThemeData(
                  color: AppColor.black,
                )),
            //scaffoldBackgroundColor: AppColor.white
          ),
          home: const HomeScreen(),
          routes: {
            '/home_screen': (context) => const HomeScreen(),
            '/selection_screen': (context) => const SelectionScreen(),
            '/reservation_screen': (context) => const ReservationScreen(),
            '/order_paid_screen': (context) => const OrderPaidScreen(),
          },
        ),
      ),
    );
    return repositoryProviders;
  }
}
