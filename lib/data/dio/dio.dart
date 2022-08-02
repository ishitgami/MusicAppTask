import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:musicapp/data/modules/song_model.dart';


class DioClient {
  final Dio dio = Dio();
  static const baseURL = "https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=";
  final String apiKey = "ee0f6a4795cedfbfd76e220df5767936";

  Future<Song> fetchSong() async {
    try {
      final response = await dio.get(baseURL+apiKey);
      final jsonR = jsonDecode(response.data);
      return Song.fromJson(jsonR );
    } on DioError catch (e) {
      print(e.error);
      throw Exception('Failed to load');
    }
  }

  // Future<Song> fetchNewsByCategory(category) async {
  //   final url = baseURL2 + "/top-headlines?category=" + category + '&apiKey=' + apiKey ;
  //   try {
  //     print(url);
  //      final response = await dio.get(url);
  //       return Song.fromJson(response.data);
  //   } on DioError catch (e) {
  //     throw Exception('Failed News By Category');
  //   }
  // }
}
