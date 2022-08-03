part of 'music_cubit.dart';

@immutable
abstract class MusicState {}

class MusicInitial extends MusicState {}

class SongsLoaded extends MusicState {
  final Song song;
  SongsLoaded({required this.song});
}

class SongsDetailLoaded extends MusicState {
  final SongDetail songDetail;
  SongsDetailLoaded({required this.songDetail});
}


