import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:rockapp/app/styles/colors.dart';
import 'package:rockapp/app/styles/text_styles.dart';
import 'package:rockapp/app/styles/touchable_opacity.dart';
import 'package:rockapp/app/styles/ui_helpers.dart';
import 'package:rockapp/core/constant/constant.dart';
import 'package:rockapp/view_models/home/settings_viewmodel.dart';
import 'package:stacked/stacked.dart';

class BookStore extends StatefulWidget {
  const BookStore({Key? key}) : super(key: key);

  @override
  _BookStoreState createState() => _BookStoreState();
}

class _BookStoreState extends State<BookStore> {
  final _searchController = TextEditingController();
  final _historyList = [1, 2, 3, 4];
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelBuilder<SettingsViewModel>.reactive(
        viewModelBuilder: () => SettingsViewModel(),
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
                        child: const HeaderText(
                          'Book Store',
                          color: AppColors.primaryColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Image.asset(AppAssets.generallogo),
                    ],
                  ),
                  const Gap(49),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.homeMenuBox,
                                  blurRadius: 8,
                                  spreadRadius: 0,
                                  offset: Offset(0, 8),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              controller: _searchController,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                hintText: 'Search...',
                                hintStyle: TextStyle(
                                  fontFamily: AppFonts.poppins,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.searchColor,
                                ),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: AppColors.lightYellow,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          const Gap(26),
                          const BodyText(
                            'Popular Books',
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: AppColors.darkBlack,
                            textAlign: TextAlign.left,
                          ),
                          const Gap(27),
                          SizedBox(
                            height: screenHeight(context) * 0.26,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: _historyList.length,
                              itemBuilder: (context, index) {
                                final item = _historyList[index];
                                return Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(AppAssets.sampleBook),
                                      const Gap(18),
                                      const BodyText(
                                        'Daily Devotional',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.darkBlack,
                                      ),
                                      const Gap(3.84),
                                      const BodyText(
                                        'Rev Thomas',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.darkBlacklight,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          const Gap(40.65),
                          const BodyText(
                            'Newest',
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: AppColors.darkBlack,
                            textAlign: TextAlign.left,
                          ),
                          const Gap(34),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: _historyList.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final item = _historyList[index];
                              return Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 20,
                                  right: 30,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(AppAssets.sampleBook),
                                        const Gap(20),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            BodyText(
                                              'Daily Devotional',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.darkBlack,
                                            ),
                                            Gap(3.84),
                                            BodyText(
                                              'Rev Thomas',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.darkBlacklight,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SvgPicture.asset(AppAssets.bookmark),
                                  ],
                                ),
                              );
                            },
                          ),
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
