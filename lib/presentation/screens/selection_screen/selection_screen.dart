import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/presentation/bloc/app_bloc.dart';
import 'package:hotel/presentation/widgets/card_info_hotel_widget/card_info_hotel_widget.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  @override
  void initState() {
    if (mounted) {
      context.read<AppBloc>().add(GetDataHotelListEvent());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Steigenberger Makadi'),
        leading: IconButton(
          splashRadius: 22,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
      ),
      body: SafeArea(
        child: BlocConsumer<AppBloc, AppState>(
          listener: (context, state) {
            if (state.errorHotels != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('error'),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state.hotels == null) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.hotels != null &&
                state.hotels!.rooms != null &&
                state.hotels!.rooms!.isNotEmpty) {
              final list = state.hotels!.rooms;
              return ListView.builder(
                itemCount: list!.length,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return CardInfoHotelWidget(
                    item: list[index],
                    key: ValueKey(list[index].id),
                  );
                },
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
