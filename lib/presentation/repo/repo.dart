// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:hotel/presentation/models/get_detail_model.dart';
import 'package:hotel/presentation/models/get_home_model.dart';
import 'package:hotel/presentation/models/get_hotel_list_model.dart';

class AppRepo {
  final Dio dio;
  AppRepo({required this.dio});

  // home
  Future<GetHomeModel> getHomeData() async {
    try {
      final response = await dio.get('75000507-da9a-43f8-a618-df698ea7176d');
      if (response.statusCode == 200) {
        final result = GetHomeModel.fromJson(response.data);
        return result;
      } else {
        return throw Exception(response.statusMessage.toString());
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }

   // hotel list
  Future<GetHotelListModel> getAllHotel() async {
    try {
      final response = await dio.get('157ea342-a8a3-4e00-a8e6-a87d170aa0a2');
      if (response.statusCode == 200) {
        final result = GetHotelListModel.fromJson(response.data);
        return result;
      } else {
        return throw Exception(response.statusMessage.toString());
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }

    // hotel list
  Future<GetDetailModel> getReservations() async {
    try {
      final response = await dio.get('63866c74-d593-432c-af8e-f279d1a8d2ff');
      if (response.statusCode == 200) {
        final result = GetDetailModel.fromJson(response.data);
        return result;
      } else {
        return throw Exception(response.statusMessage.toString());
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }
}
