import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/core/providers/current_song_notifier.dart';
import 'package:music_app/core/theme/pallete.dart';
import 'package:music_app/core/utils.dart';

class AudioSlab extends ConsumerWidget {
  const AudioSlab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentSong = ref.watch(currentSongNotifierProvider);
    if (currentSong == null) {
      return const SizedBox();
    }
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.07,
      decoration: BoxDecoration(
        color: hexToColor(currentSong.hex_code),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Hero(
                  tag: 'music-image',
                  child: Container(
                    width: 48,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          currentSong.thumbnail_url,
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      currentSong.song_name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      currentSong.artist,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Pallete.subtitleText,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () async {},
                  icon: const Icon(
                    CupertinoIcons.heart,
                    color: Pallete.whiteColor,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.play_fill,
                    color: Pallete.whiteColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
