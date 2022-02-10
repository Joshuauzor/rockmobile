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

  Future pause() async {
    setBusy(true);
    await audioPlayer.pause();
    setBusy(false);
  }

  Future resume() async {
    setBusy(true);
    await audioPlayer.resume();
    setBusy(false);
  }

  Future seek() async {
    setBusy(true);
    print('seeking');
    await audioPlayer.seek(const Duration(milliseconds: 2200));
    setBusy(false);
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

  // await audioPlayer.setReleaseMode(ReleaseMode.STOP); // set release mode so that it never releases
//     RELEASE: default mode, will release after stop/completed.
// STOP: will never release; calling play should be faster.
// LOOP

}
