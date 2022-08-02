import 'package:flutter/material.dart';
import 'package:musicapp/logic/cubit/music_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MusicCubit>(context).fetchSong();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trending'),
      ),
      body: BlocBuilder<MusicCubit, MusicState>(
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
                        
                      },
                      leading: const Icon(Icons.library_music_outlined),
                      title: Text(song
                          .message!.body!.trackList![index].track!.trackName
                          .toString()),
                      trailing: Text(song
                          .message!.body!.trackList![index].track!.artistName
                          .toString()),
                      subtitle: Text(song
                          .message!.body!.trackList![index].track!.albumName
                          .toString()),
                    ),
                  );
                })),
          );
        },
      ),
    );
  }
}
