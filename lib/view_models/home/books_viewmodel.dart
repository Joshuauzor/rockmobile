import 'package:rockapp/locator.dart';
import 'package:rockapp/model/books.dart';
import 'package:rockapp/services/home_service.dart';
import 'package:rockapp/view_models/base_viewmodel.dart';

class BooksViewModel extends BaseModel {
  final HomeService _homeService = sl<HomeService>();

  List<Books>? get topBooks => _homeService.topBooks;
  List<Books>? get newBooks => _homeService.newBooks;
  Books? get singleBook => _homeService.singleBook;

  void init() async {
    await getBooks();
  }

  Future getBooks() async {
    setBusy(true);
    await _homeService.getBooks();
    setBusy(false);
  }
}
