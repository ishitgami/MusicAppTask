import 'package:flutter/material.dart';
import 'package:musicapp/data/data_provider/data_provider.dart';
import 'package:musicapp/data/dio/dio.dart';
import 'package:musicapp/logic/bloc/connected_bloc.dart';
import 'package:musicapp/logic/cubit/lyrics_cubit.dart';
import 'package:musicapp/logic/cubit/music_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/screen/detailScreen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final ConnectedBloc _connectedBloc = ConnectedBloc();
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MusicCubit>(context).fetchSong();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Trending'),
        ),
        body: BlocProvider<ConnectedBloc>(
          create: (context) => _connectedBloc,
          child: BlocBuilder<ConnectedBloc, ConnectedState>(
            builder: (context, state) {
              if (state is ConnectedFailureState) {
                    return const Center(child: Text('Not Connected')); }
              return BlocBuilder<MusicCubit, MusicState>(
                  builder: (context, state) {
                if (state is! SongsLoaded) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final song = state.song;
                return Container(
                  margin: const EdgeInsets.all(8),
                  child: ListView.builder(
                      itemCount: song.message!.body!.trackList!.length,
                      itemBuilder: ((context, index) {
                        return Card(
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => MultiBlocProvider(
                                      providers: [
                                        BlocProvider(
                                          create: (context) => MusicCubit(
                                            dataProvider: DataProvider(
                                              dioClient: DioClient(),
                                            ),
                                          ),
                                        ),
                                        BlocProvider(
                                          create: (context) => LyricsCubit(
                                            dataProvider: DataProvider(
                                              dioClient: DioClient(),
                                            ),
                                          ),
                                        ),
                                      ],
                                      child: DetailScreen(
                                        trackId: song.message!.body!
                                            .trackList![index].track!.trackId
                                            .toString(),
                                      ),
                                    ),
                                  ));
                            },
                            leading: const Icon(Icons.library_music_outlined),
                            title: Text(song.message!.body!.trackList![index]
                                .track!.trackName
                                .toString()),
                            trailing: Text(song.message!.body!.trackList![index]
                                .track!.artistName
                                .toString()),
                            subtitle: Text(song.message!.body!.trackList![index]
                                .track!.albumName
                                .toString()),
                          ),
                        );
                      })),
                );
              });
            },
          ),
        ));
  }
}
