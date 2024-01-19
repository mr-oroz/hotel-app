import 'package:bloc/bloc.dart';
import 'package:hotel/presentation/models/get_detail_model.dart';
import 'package:hotel/presentation/models/get_home_model.dart';
import 'package:hotel/presentation/models/get_hotel_list_model.dart';
import 'package:hotel/presentation/repo/repo.dart';
import 'package:meta/meta.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required this.repo}) : super(AppState()) {
    // home data
    on<GetDataHomeEvent>((event, emit) async {
      emit(state.copyWith(isLoadingHome: true));
      try {
        final model = await repo.getHomeData();
        emit(state.copyWith(
          isLoadingHome: false,
          homeData: model,
        ));
      } catch (e) {
        emit(state.copyWith(
          isLoadingHome: false,
          errorHome: e.toString(),
        ));
      }
    });

    // hotels data
    on<GetDataHotelListEvent>((event, emit) async {
      emit(state.copyWith(isLoadingHome: true));
      try {
        final model = await repo.getAllHotel();
        emit(state.copyWith(
          isLoadingHome: false,
          hotels: model,
        ));
      } catch (e) {
        emit(state.copyWith(
          isLoadingHome: false,
          errorHotels: e.toString(),
        ));
      }
    });
    
    // current data
    on<GetDetailEvent>((event, emit) async {
      emit(state.copyWith(isLoadingHome: true));
      try {
        final model = await repo.getReservations();
        emit(state.copyWith(
          isLoadingHome: false,
          currentData: model,
        ));
      } catch (e) {
        emit(state.copyWith(
          isLoadingHome: false,
          errorCurrentData: e.toString(),
        ));
      }
    });
  }
  final AppRepo repo;
}
