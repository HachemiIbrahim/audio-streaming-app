import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/core/providers/current_song_notifier.dart';
import 'package:music_app/core/theme/pallete.dart';
import 'package:music_app/core/widgets/loader.dart';
import 'package:music_app/features/home/view/screens/upload_song.dart';
import 'package:music_app/features/home/viewmodel/home_viewmodel.dart';

class LibraryScreen extends ConsumerWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getFavSongsProvider).when(
          data: (data) {
            return ListView.builder(
              itemCount: data.length + 1,
              itemBuilder: (context, index) {
                if (index == data.length) {
                  return ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const UploadSong(),
                        ),
                      );
                    },
                    leading: const CircleAvatar(
                      radius: 35,
                      backgroundColor: Pallete.backgroundColor,
                      child: Icon(
                        CupertinoIcons.plus,
                      ),
                    ),
                    title: const Text(
                      'Upload New Song',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  );
                }

                final song = data[index];
                return ListTile(
                  onTap: () {
                    ref
                        .read(currentSongNotifierProvider.notifier)
                        .updateSong(song);
                  },
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      song.thumbnail_url,
                    ),
                    radius: 35,
                    backgroundColor: Pallete.backgroundColor,
                  ),
                  title: Text(
                    song.song_name,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  subtitle: Text(
                    song.artist,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              },
            );
          },
          error: (error, st) {
            return Center(
              child: Text(error.toString()),
            );
          },
          loading: () => const Loader(),
        );
  }
}
