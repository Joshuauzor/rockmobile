import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:rockapp/core/errors/exceptions.dart';
import 'package:rockapp/core/errors/failure.dart';
import 'package:rockapp/core/networks/api_request.dart';
import 'package:rockapp/locator.dart';
import 'package:rockapp/model/books.dart';
import 'package:rockapp/model/church_prayers.dart';
import 'package:rockapp/model/donations.dart';
import 'package:rockapp/model/music.dart';
import 'package:rockapp/model/reading.dart';
import 'package:rockapp/model/rosary.dart';
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

  List<ChurchPrayers>? _churchPrayers;
  List<ChurchPrayers>? get churchPrayers => _churchPrayers;

  List<Rosary>? _rosary;
  List<Rosary>? get rosary => _rosary;

  List<Donations>? _donationList;
  List<Donations>? get donationList => _donationList;

  Books? _singleBook;
  Books? get singleBook => _singleBook;

  DailyReading? _reading;
  DailyReading? get reading => _reading;

  Future<void> getBooks();
  Future<void> getMusic();
  Future<void> fetchVideoMedia();
  Future<Either<Failure, String>> prayerRequest({
    required String name,
    required String email,
    required String title,
    required String request,
  });
  Future<void> getChurchPrayers();
  Future<void> getRosary();
  Future<void> getDailyReading({
    required String date,
  });
  Future<void> getDonations();
}

class HomeServiceImpl extends HomeService {
  final ApiServiceRequester _apiServiceRequester = sl<ApiServiceRequester>();

  @override
  Future<void> getBooks() async {
    try {
      var response = await _apiServiceRequester.getRequest(url: 'books');
      var responseData = <Books>[];
      var responseDataTopBooks = <Books>[];

      for (var item in response.data['newBooks']) {
        responseData.add(Books.fromJson(item));
      }
      _newBooks = responseData;

      for (var item in response.data['topBooks']) {
        if (item != null) responseDataTopBooks.add(Books.fromJson(item));
      }
      _topBooks = responseDataTopBooks;
    } catch (e) {
      Logger().d('$e');
    }
  }

  @override
  Future<void> getMusic() async {
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
  Future<void> fetchVideoMedia() async {
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

  @override
  Future<Either<Failure, String>> prayerRequest({
    required String name,
    required String email,
    required String title,
    required String request,
  }) async {
    try {
      final response =
          await _apiServiceRequester.post(url: 'prayers/createRequest', body: {
        'title': title,
        'message': request,
      });
      if (!response.data['status']) {
        return Left(ServerFailure(message: response.data['message']));
      }
      return const Right('Prayer request submitted successfully');
    } catch (e) {
      Logger().d('$e');
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        if (e.response != null &&
            e.response!.statusCode! >= 500 &&
            e.response!.data != null &&
            e.response!.data['message'] != null) {
          return Left(ServerFailure(message: e.response!.data['message']));
        }
        if (e.response != null && e.response!.statusCode! >= 500) {
          return const Left(ServerFailure(message: 'server error. try again'));
        }
        if (e.response != null &&
            e.response!.data != null &&
            e.response!.data['message'] != null) {
          return Left(ServerFailure(message: e.response!.data['message']));
        } else {
          return const Left(
            ServerFailure(message: 'Server error, please try again'),
          );
        }
      }
      return Left(UnknownFailure());
    }
  }

  @override
  Future<void> getChurchPrayers() async {
    try {
      var response =
          await _apiServiceRequester.getRequest(url: 'prayers/fetchAll');
      var responseData = <ChurchPrayers>[];
      for (var item in response.data['data']['rows']) {
        responseData.add(ChurchPrayers.fromJson(item));
      }
      _churchPrayers = responseData;
    } catch (e) {
      Logger().d('$e');
    }
  }

  @override
  Future<void> getRosary() async {
    try {
      var response =
          await _apiServiceRequester.getRequest(url: 'rosary/fetchAll');
      var responseData = <Rosary>[];
      for (var item in response.data['data']['rows']) {
        responseData.add(Rosary.fromJson(item));
      }
      _rosary = responseData;
    } catch (e) {
      Logger().d('$e');
    }
  }

  @override
  Future<void> getDailyReading({
    required String date,
  }) async {
    _reading = null;
    try {
      final response = await _apiServiceRequester.getRequest(
          url: 'reflections/fetch?date=$date');
      if (response.data['data'] == null) {
        _reading = null;
      } else {
        _reading = DailyReading.fromJson(response.data['data']);
      }
    } catch (e) {
      Logger().d('$e');
    }
  }

  @override
  Future<void> getDonations() async {
    try {
      var response =
          await _apiServiceRequester.getRequest(url: 'donation/fetchAll');
      var responseData = <Donations>[];
      for (var item in response.data['data']['rows']) {
        responseData.add(Donations.fromJson(item));
      }
      _donationList = responseData;
    } catch (e) {
      Logger().d('$e');
    }
  }
}
