import 'package:rockapp/locator.dart';
import 'package:rockapp/model/music.dart';
import 'package:rockapp/services/home_service.dart';
import 'package:rockapp/view_models/base_viewmodel.dart';

import 'package:audioplayers/audioplayers.dart';

class MusicViewModel extends BaseModel {
  final HomeService _homeService = sl<HomeService>();
  AudioPlayer audioPlayer = AudioPlayer();
  List<Music>? get audioMusic => _homeService.audioMusic;

  Future play({required url}) async {
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

  void init() async {
    setBusy(true);
    await _homeService.getMusic();
    setBusy(false);
  }
}
