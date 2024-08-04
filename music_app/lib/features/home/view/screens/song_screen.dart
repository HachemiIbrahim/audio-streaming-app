import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/core/theme/pallete.dart';
import 'package:music_app/core/widgets/loader.dart';
import 'package:music_app/features/home/viewmodel/home_viewmodel.dart';

class SongScreen extends ConsumerWidget {
  const SongScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final querry = MediaQuery.of(context).size;

    return Padding(
      padding:
          EdgeInsets.only(top: querry.height * 0.05, left: querry.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Latest today',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ref.watch(getAllSongsProvider).when(
                data: (songs) {
                  return SizedBox(
                    height: 260,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: songs.length,
                      itemBuilder: (context, index) {
                        final song = songs[index];

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 180,
                              height: 180,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    song.thumbnail_url,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                            const SizedBox(height: 5),
                            SizedBox(
                              width: 180,
                              child: Text(
                                song.song_name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                maxLines: 1,
                              ),
                            ),
                            SizedBox(
                              width: 180,
                              child: Text(
                                song.artist,
                                style: const TextStyle(
                                  color: Pallete.subtitleText,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                maxLines: 1,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                },
                error: (error, st) {
                  return Center(
                    child: Text(
                      error.toString(),
                    ),
                  );
                },
                loading: () => const Loader(),
              ),
        ],
      ),
    );
  }
}
