import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:musicapp/data/data_provider/data_provider.dart';
import 'package:musicapp/data/modules/songDetail_model.dart';
import 'package:musicapp/data/modules/songLyrics_model.dart';
import 'package:musicapp/data/modules/song_model.dart';

part 'music_state.dart';

class MusicCubit extends Cubit<MusicState> {
  final DataProvider dataProvider;
  MusicCubit({required this.dataProvider}) : super(MusicInitial());

  void fetchSong() {
    dataProvider.fetchSongs().then((song) {
      emit(SongsLoaded(song:song ));
    });
  }

  void fetchSongDetail(trackId) {
    dataProvider.fetchSongByTrackID(trackId).then((songDetail) {
      emit(SongsDetailLoaded(songDetail:songDetail ));
    });
    
  }

  
  
}
