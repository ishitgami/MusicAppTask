import 'dart:async';
import 'package:musicapp/data/dio/dio.dart';
import 'package:musicapp/data/modules/songDetail_model.dart';
import 'package:musicapp/data/modules/songLyrics_model.dart';
import 'package:musicapp/data/modules/song_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class DataProvider {
  final DioClient dioClient;

  DataProvider({required this.dioClient});

  Future<Song> fetchSongs() async {
    final songRaw = await dioClient.fetchSong();
    return songRaw;
  }

  Future<SongDetail> fetchSongByTrackID(trackID) async {
    final songByIDRaw = await dioClient.fetchSongByTrackID(trackID);
    return songByIDRaw;
  }

  Future<SongLyrics> fetchSongLyricsByTrackID(trackID) async {
    final songLyricsByIDRaw = await dioClient.fetchSongLyricsByTrackID(trackID);
    return songLyricsByIDRaw;
  }
}
