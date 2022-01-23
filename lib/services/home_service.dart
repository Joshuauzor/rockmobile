import 'package:logger/logger.dart';
import 'package:rockapp/core/networks/api_request.dart';
import 'package:rockapp/locator.dart';
import 'package:rockapp/model/books.dart';
import 'package:stacked/stacked.dart';

abstract class HomeService with ReactiveServiceMixin {
  List<Books>? _books;
  List<Books>? get books => _books;

  List<Books>? _topBooks;
  List<Books>? get topBooks => _topBooks;

  Future<void> getBooks();
}

class HomeServiceImpl extends HomeService {
  final ApiServiceRequester _apiServiceRequester = sl<ApiServiceRequester>();
  @override
  Future getBooks() async {
    try {
      var response = await _apiServiceRequester.getRequest(url: 'books');
      print(response);
    } catch (e) {
      Logger().d('$e');
    }
  }
}
