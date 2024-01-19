import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/presentation/bloc/app_bloc.dart';
import 'package:hotel/presentation/core/data.dart';
import 'package:hotel/presentation/models/get_home_model.dart';
import 'package:hotel/presentation/theme/app_color.dart';
import 'package:hotel/presentation/theme/app_fonts.dart';
import 'package:hotel/presentation/widgets/app_button/app_button.dart';
import 'package:hotel/presentation/widgets/card_text_widget/card_text_widget.dart';
import 'package:hotel/presentation/widgets/custom_snape_container/custom_snape_container.dart';
import 'package:hotel/presentation/widgets/info_price_description_widget/info_price_description_widget.dart';
import 'package:hotel/presentation/widgets/rating_status_widget/rating_status_widget.dart';
import 'package:hotel/presentation/widgets/service_widget/service_widget.dart';
import 'package:hotel/presentation/widgets/swiper_widget/swiper_widget.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<AppBloc>().add(GetDataHomeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Отель',
          style: AppFonts.w500s16fSfPro,
        ),
      ),
      body: SafeArea(
        child: BlocConsumer<AppBloc, AppState>(
          listener: (context, state) {
            if (state.errorHome != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('error 404 found'),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state.homeData == null) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.homeData != null) {
              return ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  _buildTopSection(
                    state.homeData!,
                    const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildBottomSection(
                    state.homeData!,
                    const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                  ),
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(color: AppColor.white),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 28,
            top: 12,
          ),
          child: AppButton(
            onPressed: () {
              Navigator.pushNamed(context, '/selection_screen');
            },
            title: 'К выбору номера',
          ),
        ),
      ),
    );
  }

  Widget _buildTopSection(GetHomeModel appState, EdgeInsets padding) {
    return CustomShapeContainer(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (appState.imageUrls!.isNotEmpty)
            SwiperWidget(
              images: appState.imageUrls,
            ),
          const SizedBox(height: 16),
          if (appState.ratingName != null && appState.rating != null)
            RatingStatusWidget(
                rating: '${appState.rating.toString()} ${appState.ratingName}'),
          const SizedBox(height: 8),
          if (appState.name != null)
            Text(
              appState.name.toString(),
              style: AppFonts.w500s22fSfPro,
            ),
          const SizedBox(height: 8),
          if (appState.adress != null)
            Text(
              appState.adress.toString(),
              style: AppFonts.w500s14fSfPro.copyWith(
                color: AppColor.blue,
              ),
            ),
          const SizedBox(height: 16),
          if (appState.minimalPrice != null && appState.priceForIt != null)
            InfoPriceDesctiptionWidget(
              price: 'от ${appState.minimalPrice}',
              description: '${appState.priceForIt}',
            ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildBottomSection(GetHomeModel appState, EdgeInsets padding) {
    return CustomShapeContainer(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          const Text(
            'Об отеле',
            style: AppFonts.w500s22fSfPro,
          ),
          const SizedBox(height: 16),
          if (appState.aboutTheHotel != null &&
              appState.aboutTheHotel!.peculiarities != null &&
              appState.aboutTheHotel!.peculiarities!.isNotEmpty)
            Wrap(
              runSpacing: 8,
              spacing: 8,
              children: appState.aboutTheHotel!.peculiarities!.map((item) {
                return CardTextWidget(title: item);
              }).toList(),
            ),
          const SizedBox(height: 12),
          if (appState.aboutTheHotel != null &&
              appState.aboutTheHotel!.description != null)
            Text(
              '${appState.aboutTheHotel!.description}',
              style: AppFonts.w400s16fSfPro,
            ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: AppColor.colorBg,
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: serviceList.map((item) {
                return ServiceWidget(
                  icon: item.icon,
                  title: item.title,
                  subtitle: item.title,
                  onPressed: () {},
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
