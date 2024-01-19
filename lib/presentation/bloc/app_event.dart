part of 'app_bloc.dart';

@immutable
sealed class AppEvent {}

class GetDataHomeEvent extends AppEvent{}
class GetDataHotelListEvent extends AppEvent{}
class GetDetailEvent extends AppEvent{}


