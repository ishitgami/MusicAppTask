part of 'lyrics_cubit.dart';

@immutable
abstract class LyricsState {}

class LyricsInitial extends LyricsState {}


class SongsLyricsLoaded extends LyricsState {
  final SongLyrics songLyrics;
  SongsLyricsLoaded({required this.songLyrics});
}