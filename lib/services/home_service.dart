import 'package:logger/logger.dart';
import 'package:rockapp/core/networks/api_request.dart';
import 'package:rockapp/locator.dart';
import 'package:rockapp/model/books.dart';
import 'package:stacked/stacked.dart';

abstract class HomeService with ReactiveServiceMixin {
  List<Books>? _newBooks;
  List<Books>? get newBooks => _newBooks;

  List<Books>? _topBooks;
  List<Books>? get topBooks => _topBooks;

  Books? _singleBook;
  Books? get singleBook => _singleBook;

  Future<void> getBooks();
  Future<void> getSingleBook({required String uuid});
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
  Future getSingleBook({required uuid}) async {
    _singleBook = null;
    try {
      var response = await _apiServiceRequester.getRequest(
          url: 'books/fetchSingle?book_id=$uuid');
      _singleBook = Books.fromJson(response.data['data']);
    } catch (e) {
      Logger().d('$e');
    }
  }
}
