part of 'music_cubit.dart';

@immutable
abstract class MusicState {}

class MusicInitial extends MusicState {}

class SongsLoaded extends MusicState {
 
  final Song song;
  SongsLoaded({required this.song});

}
