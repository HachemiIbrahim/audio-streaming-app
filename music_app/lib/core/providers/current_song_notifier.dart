import 'package:just_audio/just_audio.dart';
import 'package:music_app/features/home/models/song_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_song_notifier.g.dart';

@riverpod
class CurrentSongNotifier extends _$CurrentSongNotifier {
  AudioPlayer? audioPlayer;
  @override
  SongModel? build() {
    return null;
  }

  void updateSong(SongModel song) async {
    await audioPlayer?.stop();
    audioPlayer = AudioPlayer();

    final audioSource = AudioSource.uri(
      Uri.parse(song.song_url),
    );
    audioPlayer!.setAudioSource(audioSource);

    state = song;
  }
}
