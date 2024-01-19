part of 'app_bloc.dart';

class AppState {
  final GetHomeModel? homeData;
  final GetDetailModel? currentData;
  final GetHotelListModel? hotels;
  final bool isLoadingHome;

  final String? errorHome;
  final String? errorHotels;
  final String? errorCurrentData;

  AppState(
      {this.homeData,
      this.hotels,
      this.currentData,
      this.isLoadingHome = false,
      this.errorHome,
      this.errorHotels,
      this.errorCurrentData});
  AppState copyWith({
    GetHomeModel? homeData,
    GetHotelListModel? hotels,
    GetDetailModel? currentData,
    bool? isLoadingHome,
    String? errorHome,
    String? errorHotels,
    String? errorCurrentData,
  }) {
    return AppState(
      homeData: homeData ?? this.homeData,
      hotels: hotels ?? this.hotels,
      currentData: currentData ?? this.currentData,
      isLoadingHome: isLoadingHome ?? this.isLoadingHome,
      errorHome: errorHome ?? this.errorHome,
      errorHotels: errorHotels ?? this.errorHotels,
      errorCurrentData: errorCurrentData ?? this.errorCurrentData,
    );
  }
}
