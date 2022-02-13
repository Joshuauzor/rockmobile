import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rockapp/app/styles/colors.dart';
import 'package:rockapp/app/styles/text_styles.dart';
import 'package:rockapp/app/styles/touchable_opacity.dart';
import 'package:rockapp/app/styles/ui_helpers.dart';
import 'package:rockapp/app/views/widgets/widgets.dart';
import 'package:rockapp/core/constant/constant.dart';
import 'package:rockapp/core/extensions/string_extensions.dart';
import 'package:rockapp/core/navigators/navigators.dart';
import 'package:rockapp/features/books/books.dart';
import 'package:rockapp/features/books/presentation/pages/single_book.dart';
import 'package:rockapp/model/books.dart';
import 'package:rockapp/view_models/home/books_viewmodel.dart';
import 'package:stacked/stacked.dart';

class BookStore extends StatefulWidget {
  const BookStore({Key? key}) : super(key: key);

  @override
  _BookStoreState createState() => _BookStoreState();
}

class _BookStoreState extends State<BookStore> {
  final _searchController = TextEditingController();
  String _searchText = '';

  @override
  void initState() {
    _searchText = _searchController.text.trim();
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text.trim();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelBuilder<BooksViewModel>.reactive(
        viewModelBuilder: () => BooksViewModel(),
        disposeViewModel: false,
        onModelReady: (model) => model.init(),
        builder: (context, model, child) {
          final _bookList = _searchText.isEmpty
              ? model.newBooks
              : model.newBooks == null
                  ? []
                  : model.newBooks!
                      .where(
                        (item) =>
                            item.title.contains(
                              RegExp(StringUtil.escapeSpecial(_searchText),
                                  caseSensitive: false),
                            ) ||
                            item.author.contains(
                              RegExp(StringUtil.escapeSpecial(_searchText),
                                  caseSensitive: false),
                            ),
                      )
                      .toList();
          return (_bookList == null)
              ? const Center(
                  child: Loader(),
                )
              : SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 29, right: 29),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const HeaderText(
                              'Book Store',
                              color: AppColors.primaryColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                            Image.asset(AppAssets.generallogo),
                          ],
                        ),
                        const Gap(49),
                        SearchBar(searchController: _searchController),
                        const Gap(26),
                        Expanded(
                          child: RefreshIndicator(
                            onRefresh: () async => await model.getBooks(),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const BodyText(
                                    'Popular Books',
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.darkBlack,
                                    textAlign: TextAlign.left,
                                  ),
                                  const Gap(27),
                                  model.topBooks != null
                                      ? SizedBox(
                                          height: screenHeight(context) * 0.26,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            itemCount: model.topBooks!.length,
                                            itemBuilder: (context, index) {
                                              final Books item =
                                                  model.topBooks![index];
                                              return TouchableOpacity(
                                                onTap: () =>
                                                    Navigator.pushNamed(
                                                  context,
                                                  Routes.singleBook,
                                                  arguments: SingleBooksArgs(
                                                    uuid: item.uuid,
                                                    title: item.title,
                                                    description:
                                                        item.description,
                                                    price: item.price,
                                                    bookCover: item.bookCover,
                                                    author: item.author,
                                                    paid: item.paid,
                                                    bookUrl: item.bookUrl,
                                                    purchaseLink:
                                                        item.purchaseLink,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 10),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      CachedNetworkImage(
                                                        imageUrl:
                                                            item.bookCover,
                                                        imageBuilder: (
                                                          context,
                                                          imageProvider,
                                                        ) {
                                                          return Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .rectangle,
                                                              image:
                                                                  DecorationImage(
                                                                image:
                                                                    imageProvider,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        placeholder: (context,
                                                                url) =>
                                                            Image.asset(AppAssets
                                                                .sampleBook),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Image.asset(
                                                          AppAssets.sampleBook,
                                                        ),
                                                      ),
                                                      const Gap(18),
                                                      BodyText(
                                                        item.title,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            AppColors.darkBlack,
                                                      ),
                                                      const Gap(3.84),
                                                      BodyText(
                                                        item.author,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors
                                                            .darkBlacklight,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        )
                                      : const BodyText(
                                          'Popular Books not available'),
                                  const Gap(40.65),
                                  const BodyText(
                                    'Newest',
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.darkBlack,
                                    textAlign: TextAlign.left,
                                  ),
                                  const Gap(34),
                                  _bookList.isNotEmpty
                                      ? ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: _bookList.length,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            final Books item = _bookList[index];
                                            return TouchableOpacity(
                                              onTap: () => Navigator.pushNamed(
                                                context,
                                                Routes.singleBook,
                                                arguments: SingleBooksArgs(
                                                  uuid: item.uuid,
                                                  title: item.title,
                                                  description: item.description,
                                                  price: item.price,
                                                  bookCover: item.bookCover,
                                                  author: item.author,
                                                  paid: item.paid,
                                                  bookUrl: item.bookUrl,
                                                  purchaseLink:
                                                      item.purchaseLink,
                                                ),
                                              ),
                                              child: VerticalBooks(item: item),
                                            );
                                          },
                                        )
                                      : const BodyText('No Books available'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
