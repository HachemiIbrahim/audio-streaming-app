import 'package:just_audio/just_audio.dart';
import 'package:music_app/features/home/models/song_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_song_notifier.g.dart';

@riverpod
class CurrentSongNotifier extends _$CurrentSongNotifier {
  AudioPlayer? audioPlayer;
  bool isplaying = false;
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
    await audioPlayer!.setAudioSource(audioSource);

    audioPlayer!.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        audioPlayer!.seek(Duration.zero);
        audioPlayer!.pause();
        isplaying = false;

        this.state = this.state?.copyWith(hex_code: this.state?.hex_code);
      }
    });
    audioPlayer!.play();
    isplaying = true;
    state = song;
  }

  void playPause() {
    if (isplaying) {
      audioPlayer?.pause();
    } else {
      audioPlayer?.play();
    }
    isplaying = !isplaying;
    state = state?.copyWith(hex_code: state?.hex_code);
  }

  void seek(double val) {
    audioPlayer!.seek(
      Duration(
        milliseconds: (val * audioPlayer!.duration!.inMilliseconds).toInt(),
      ),
    );
  }
}
