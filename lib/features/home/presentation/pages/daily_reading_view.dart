import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:rockapp/app/styles/colors.dart';
import 'package:rockapp/app/styles/text_styles.dart';
import 'package:rockapp/app/styles/touchable_opacity.dart';
import 'package:rockapp/app/styles/ui_helpers.dart';
import 'package:rockapp/app/views/widgets/loader.dart';
import 'package:rockapp/core/constant/constant.dart';
import 'package:rockapp/view_models/home/reading_viewmodel.dart';
import 'package:stacked/stacked.dart';

class DailyReadingView extends StatefulWidget {
  final DailyReadingViewArgs params;
  const DailyReadingView({Key? key, required this.params}) : super(key: key);

  @override
  _DailyReadingViewState createState() => _DailyReadingViewState();
}

class _DailyReadingViewState extends State<DailyReadingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelBuilder<ReadingViewModel>.reactive(
        viewModelBuilder: () => ReadingViewModel(),
        onModelReady: (model) =>
            model.getDailyReading(date: widget.params.date, context: context),
        builder: (context, model, child) {
          return model.busy
              ? const Center(
                  child: Loader(),
                )
              : SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 31),
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
                            const HeaderText(
                              'Daily Reading',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(
                              width: screenWidth(context) * 0.15,
                            )
                          ],
                        ),
                        const Gap(24),
                        model.reading != null
                            ? Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl: model.reading!.coverImage,
                                            imageBuilder:
                                                (context, imageProvider) {
                                              return Container(
                                                height: 140,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  image: DecorationImage(
                                                    image: imageProvider,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(12),
                                                  ),
                                                ),
                                              );
                                            },
                                            placeholder: (context, url) =>
                                                Image.asset(AppAssets.exodus),
                                            errorWidget: (context, url,
                                                    error) =>
                                                Image.asset(AppAssets.exodus),
                                          ),
                                          const Gap(15),
                                          HeaderText(
                                            model.reading!.useDate,
                                            color: AppColors.black,
                                            fontSize: 14,
                                          ),
                                          HeaderText(
                                            model.reading!.dayTag,
                                            color: AppColors.black,
                                            fontSize: 14,
                                          ),
                                          HeaderText(
                                            'Liturgical Color: ${model.reading!.vestment}',
                                            color: AppColors.black,
                                            fontSize: 14,
                                          ),
                                          HeaderText(
                                            'Rosary: ${model.reading!.rosary}',
                                            color: AppColors.black,
                                            fontSize: 14,
                                          ),
                                          HeaderText(
                                            'Day Saint: ${model.reading!.daySaint}',
                                            color: AppColors.black,
                                            fontSize: 14,
                                          ),
                                        ],
                                      ),
                                      const Gap(11),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 21),
                                        child: Divider(),
                                      ),
                                      const Gap(11),
                                      const HeaderText(
                                        'First Reading',
                                        color: AppColors.black,
                                        fontSize: 14,
                                      ),
                                      const Gap(3),
                                      HeaderText(
                                        model.reading!.firstKeyVerse,
                                        color: AppColors.primaryColor,
                                        fontSize: 12,
                                      ),
                                      const Gap(3),
                                      HeaderText(
                                        model.reading!.firstReadingVerse,
                                        color: AppColors.black,
                                        fontSize: 12,
                                      ),
                                      const Gap(3),
                                      HeaderText(
                                        model.reading!.firstReadingTopic,
                                        color: AppColors.black,
                                        fontSize: 13,
                                      ),
                                      const Gap(8),
                                      LongText(
                                        model.reading!.firstReading,
                                      ),
                                      model.reading!.secondReadingTopic != ''
                                          ? Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Gap(11),
                                                const HeaderText(
                                                  'Second Reading',
                                                  color: AppColors.black,
                                                  fontSize: 14,
                                                ),
                                                const Gap(3),
                                                HeaderText(
                                                  model.reading!.secondKeyVerse,
                                                  color: AppColors.primaryColor,
                                                  fontSize: 12,
                                                ),
                                                const Gap(3),
                                                HeaderText(
                                                  model.reading!
                                                      .secondReadingVerse,
                                                  color: AppColors.black,
                                                  fontSize: 12,
                                                ),
                                                const Gap(3),
                                                HeaderText(
                                                  model.reading!
                                                      .secondReadingTopic,
                                                  color: AppColors.black,
                                                  fontSize: 13,
                                                ),
                                                const Gap(8),
                                                LongText(
                                                  model.reading!.secondReading,
                                                ),
                                              ],
                                            )
                                          : const SizedBox(),
                                      const Gap(11),
                                      const HeaderText(
                                        'Responsorial Psalm',
                                        color: AppColors.readingRed,
                                        fontSize: 14,
                                      ),
                                      const Gap(3),
                                      HeaderText(
                                        model.reading!.responsorialVerse,
                                        color: AppColors.primaryColor,
                                        fontSize: 12,
                                      ),
                                      const Gap(3),
                                      HeaderText(
                                        model.reading!.response,
                                        color: AppColors.black,
                                        fontSize: 12,
                                      ),
                                      const Gap(3),
                                      LongText(
                                        model.reading!.responsorialPsalms,
                                      ),
                                      const Gap(11),
                                      const HeaderText(
                                        'Alleluia Alleluia',
                                        color: AppColors.black,
                                        fontSize: 14,
                                      ),
                                      const Gap(3),
                                      LongText(
                                        model.reading!.acclaimation,
                                      ),
                                      const Gap(11),
                                      const HeaderText(
                                        'Gospel Reading',
                                        color: AppColors.black,
                                        fontSize: 14,
                                      ),
                                      const Gap(3),
                                      HeaderText(
                                        model.reading!.gospelKeyVerse,
                                        color: AppColors.primaryColor,
                                        fontSize: 12,
                                      ),
                                      const Gap(3),
                                      HeaderText(
                                        model.reading!.gospelReadingVerse,
                                        color: AppColors.black,
                                        fontSize: 12,
                                      ),
                                      const Gap(3),
                                      HeaderText(
                                        model.reading!.gospelReadingTopic,
                                        color: AppColors.black,
                                        fontSize: 13,
                                      ),
                                      const Gap(8),
                                      LongText(
                                        model.reading!.gospelReading,
                                      ),
                                      const Gap(11),
                                      const HeaderText(
                                        'Today with Padre Rich',
                                        color: AppColors.black,
                                        fontSize: 14,
                                      ),
                                      const Gap(3),
                                      LongText(
                                        model.reading!.reflection,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : const SizedBox()
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}

class DailyReadingViewArgs {
  final String date;

  DailyReadingViewArgs({required this.date});
}
