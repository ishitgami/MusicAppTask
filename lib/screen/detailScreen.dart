import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:musicapp/logic/bloc/connected_bloc.dart';
import 'package:musicapp/logic/cubit/lyrics_cubit.dart';
import 'package:musicapp/logic/cubit/music_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailScreen extends StatelessWidget {
   DetailScreen({required this.trackId});
  final String trackId;
   final ConnectedBloc _connectedBloc = ConnectedBloc();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MusicCubit>(context).fetchSongDetail(trackId);
    BlocProvider.of<LyricsCubit>(context).fetchSongLyrics(trackId);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: BlocProvider<ConnectedBloc>(
            create: (context) => _connectedBloc,
            child: BlocBuilder<ConnectedBloc, ConnectedState>(
              builder: (context, state) {
                if (state is ConnectedFailureState) {
                  return const Center(
                    child: Text('Check Connection'),
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<MusicCubit, MusicState>(
                      builder: (context, state) {
                        if (state is! SongsDetailLoaded) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        final songDeatail = state.songDetail;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Name',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text(
                              songDeatail.message!.body!.track!.trackName
                                  .toString(),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Artist',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text(
                              songDeatail.message!.body!.track!.artistName
                                  .toString(),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Album Name',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text(
                              songDeatail.message!.body!.track!.albumName
                                  .toString(),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Explicit',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text(
                              songDeatail.message!.body!.track!.explicit.toString(),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Rating',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text(
                              songDeatail.message!.body!.track!.trackRating
                                  .toString(),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Lyrics',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ],
                        );
                      },
                    ),
                    BlocBuilder<LyricsCubit, LyricsState>(
                      builder: (context, state) {
                        if (state is! SongsLyricsLoaded) {
                          // print(state.toString());
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
      
                        final songLyrics = state.songLyrics;
                        // print('songLyrics------${songLyrics.message!.body!.lyrics!.lyricsBody}');
                        return Container(
                          child: Text(songLyrics.message!.body!.lyrics!.lyricsBody
                              .toString()),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
