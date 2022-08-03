import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:musicapp/data/data_provider/data_provider.dart';
import 'package:musicapp/data/modules/songLyrics_model.dart';

part 'lyrics_state.dart';

class LyricsCubit extends Cubit<LyricsState> {
   final DataProvider dataProvider;
  LyricsCubit({required this.dataProvider}) : super(LyricsInitial());

  void fetchSongLyrics(trackId) {
    dataProvider.fetchSongLyricsByTrackID(trackId).then((songLyric) {
      emit(SongsLyricsLoaded(songLyrics: songLyric ));
    });
  }
}
