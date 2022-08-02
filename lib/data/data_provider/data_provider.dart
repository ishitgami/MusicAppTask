import 'package:musicapp/data/dio/dio.dart';
import 'package:musicapp/data/modules/song_model.dart';

class DataProvider{
  final DioClient dioClient;

  DataProvider({required this.dioClient});

  Future<Song> fetchSongs() async {
     print('indataProvider1');
    final songRaw = await dioClient.fetchSong();

    // print('newsRaw--->${songRaw.message!.body!.trackList}');
    print('indataProvider2');
    return songRaw;
  }

  // Future<Song> fetchNewsByCategory() async {
  //   final newsByCategoryRaw = await dioClient.fetchNewsByCategory('technology');
  //   return newsByCategoryRaw;
  // }

}