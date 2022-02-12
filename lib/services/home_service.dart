import 'package:logger/logger.dart';
import 'package:rockapp/core/networks/api_request.dart';
import 'package:rockapp/locator.dart';
import 'package:rockapp/model/books.dart';
import 'package:rockapp/model/music.dart';
import 'package:stacked/stacked.dart';

abstract class HomeService with ReactiveServiceMixin {
  List<Books>? _newBooks;
  List<Books>? get newBooks => _newBooks;

  List<Books>? _topBooks;
  List<Books>? get topBooks => _topBooks;

  List<Music>? _audioMusic;
  List<Music>? get audioMusic => _audioMusic;

  List<Music>? _videoMedia;
  List<Music>? get videoMedia => _videoMedia;

  Books? _singleBook;
  Books? get singleBook => _singleBook;

  Future<void> getBooks();
  Future<void> getMusic();
  Future<void> fetchVideoMedia();
}

class HomeServiceImpl extends HomeService {
  final ApiServiceRequester _apiServiceRequester = sl<ApiServiceRequester>();

  @override
  Future getBooks() async {
    try {
      var response = await _apiServiceRequester.getRequest(url: 'books');
      var responseData = <Books>[];
      for (var item in response.data['newBooks']) {
        responseData.add(Books.fromJson(item));
      }
      _newBooks = responseData;
    } catch (e) {
      Logger().d('$e');
    }
  }

  @override
  Future getMusic() async {
    try {
      var response = await _apiServiceRequester.getRequest(
          url: 'sermons/fetchAll?media=mp3');
      var responseData = <Music>[];
      for (var item in response.data['data']['rows']) {
        responseData.add(Music.fromJson(item));
      }
      _audioMusic = responseData;
    } catch (e) {
      Logger().d('$e');
    }
  }

  @override
  Future fetchVideoMedia() async {
    try {
      var response = await _apiServiceRequester.getRequest(
          url: 'sermons/fetchAll?media=mp4');

      var responseData = <Music>[];

      for (var item in response.data['data']['rows']) {
        responseData.add(Music.fromJson(item));
      }
      _videoMedia = responseData;
    } catch (e) {
      Logger().d('$e');
    }
  }
}
