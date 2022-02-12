import 'package:rockapp/locator.dart';
import 'package:rockapp/model/music.dart';
import 'package:rockapp/services/home_service.dart';
import 'package:rockapp/view_models/base_viewmodel.dart';

class MediaViewModel extends BaseModel {
  final HomeService _homeService = sl<HomeService>();
  List<Music>? get videoMedia => _homeService.videoMedia;

  void init() async {
    await getVideoMedia();
  }

  Future getVideoMedia() async {
    setBusy(true);
    await _homeService.fetchVideoMedia();
    setBusy(false);
  }
}
