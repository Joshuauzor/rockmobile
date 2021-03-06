import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:rockapp/app/styles/colors.dart';
import 'package:rockapp/app/styles/text_styles.dart';
import 'package:rockapp/app/styles/touchable_opacity.dart';
import 'package:rockapp/app/views/views.dart';
import 'package:rockapp/core/constant/constant.dart';
import 'package:rockapp/core/navigators/routes.dart';
import 'package:rockapp/features/home/home.dart';
import 'package:rockapp/view_models/home/books_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SingleBook extends StatefulWidget {
  final SingleBooksArgs params;
  const SingleBook({Key? key, required this.params}) : super(key: key);

  @override
  _SingleBookState createState() => _SingleBookState();
}

class _SingleBookState extends State<SingleBook> {
  String? webBaseUrl = dotenv.env[WEB_BASE_URL];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelBuilder<BooksViewModel>.reactive(
        viewModelBuilder: () => BooksViewModel(),
        builder: (context, model, child) {
          return SafeArea(
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
                              fontWeight: FontWeight.w700,
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
                            imageUrl: widget.params.bookCover,
                            imageBuilder: (context, imageProvider) {
                              return Container(
                                width: 200,
                                height: 300,
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
                            errorWidget: (context, url, error) => Image.asset(
                              AppAssets.sampleBook,
                            ),
                          ),
                          const Gap(20),
                          BodyText(
                            widget.params.title,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: AppColors.darkBlack,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                          const Gap(12),
                          BodyText(
                            widget.params.author,
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
                              widget.params.description,
                            ),
                          ),
                          const Gap(17),
                          NextButton(
                            label: 'Buy Book Now For N${widget.params.price}',
                            onPressed: () => Navigator.pushNamed(
                              context,
                              Routes.rockWebView,
                              arguments: RockWebViewArgs(
                                uuid: widget.params.uuid,
                                title: 'Books',
                                url:
                                    '$webBaseUrl/home/view_book/${widget.params.uuid}',
                              ),
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
  final String title;
  final String description;
  final String price;
  final dynamic bookCover;
  final String author;
  final String paid;
  final String bookUrl;
  final dynamic purchaseLink;

  SingleBooksArgs({
    required this.uuid,
    required this.title,
    required this.description,
    required this.price,
    required this.bookCover,
    required this.author,
    required this.paid,
    required this.bookUrl,
    required this.purchaseLink,
  });
}
