import 'package:rockapp/locator.dart';
import 'package:rockapp/model/music.dart';
import 'package:rockapp/services/home_service.dart';
import 'package:rockapp/view_models/base_viewmodel.dart';

import 'package:audioplayers/audioplayers.dart';

class MusicViewModel extends BaseModel {
  final HomeService _homeService = sl<HomeService>();
  AudioPlayer audioPlayer = AudioPlayer();
  List<Music>? get audioMusic => _homeService.audioMusic;

  play({required url}) async {
    setBusy(true);
    await audioPlayer.play(url, isLocal: false);
    setBusy(false);
  }

  pause() async {
    setBusy(true);
    await audioPlayer.pause();
    setBusy(false);
  }

  resume() async {
    setBusy(true);
    await audioPlayer.resume();
    setBusy(false);
  }

  seek() async {
    await audioPlayer.seek(const Duration(milliseconds: 1200));
  }

  // stop() async {
  //   setBusy(true);
  //   await audioPlayer.stop();
  //   setBusy(false);
  // }

  void init() async {
    setBusy(true);
    await _homeService.getMusic();
    setBusy(false);
  }

  Future fetchMusic() async {}

  // await audioPlayer.setReleaseMode(ReleaseMode.STOP); // set release mode so that it never releases
//     RELEASE: default mode, will release after stop/completed.
// STOP: will never release; calling play should be faster.
// LOOP

}
