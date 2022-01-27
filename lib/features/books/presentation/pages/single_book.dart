import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:rockapp/app/styles/colors.dart';
import 'package:rockapp/app/styles/text_styles.dart';
import 'package:rockapp/app/styles/touchable_opacity.dart';
import 'package:rockapp/app/views/views.dart';
import 'package:rockapp/core/constant/constant.dart';
import 'package:rockapp/view_models/home/books_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SingleBook extends StatefulWidget {
  final SingleBooksArgs params;
  const SingleBook({Key? key, required this.params}) : super(key: key);

  @override
  _SingleBookState createState() => _SingleBookState();
}

class _SingleBookState extends State<SingleBook> {
  final _searchController = TextEditingController();
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
        onModelReady: (model) => model.getSingleBook(uuid: widget.params.uuid),
        builder: (context, model, child) {
          return (model.singleBook == null)
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
                            TouchableOpacity(
                              onTap: () {
                                if (Navigator.canPop(context)) {
                                  Navigator.pop(context);
                                }
                              },
                              child: Row(
                                children: [
                                  SvgPicture.asset(AppAssets.arrowLeft),
                                  const Gap(12),
                                  const HeaderText(
                                    'Back',
                                    color: AppColors.lightBlack,
                                    fontSize: 17,
                                  ),
                                ],
                              ),
                            ),
                            Image.asset(AppAssets.generallogo),
                          ],
                        ),
                        const Gap(13),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: HeaderText(
                                    'Book Summary',
                                    color: AppColors.primaryColor,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const Gap(38),
                                CachedNetworkImage(
                                  imageUrl:
                                      'https://rockapostolate.org/public/users/books/1640205994_f75d93a5d394458e78a3.jpg',
                                  // imageUrl: model.singleBook!.bookCover,
                                  imageBuilder: (context, imageProvider) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  },
                                  placeholder: (context, url) =>
                                      Image.asset(AppAssets.sampleBook),
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                    AppAssets.sampleBook,
                                  ),
                                ),
                                const Gap(20),
                                BodyText(
                                  model.singleBook!.title,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.darkBlack,
                                ),
                                const Gap(12),
                                BodyText(
                                  model.singleBook!.author,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.darkBlacklight,
                                ),
                                const Gap(57),
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: BodyText(
                                    'About',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.darkBlack,
                                  ),
                                ),
                                const Gap(4),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: LongText(
                                    model.singleBook!.description,
                                  ),
                                )
                              ],
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

class SingleBooksArgs {
  final dynamic uuid;
  SingleBooksArgs({required this.uuid});
}
