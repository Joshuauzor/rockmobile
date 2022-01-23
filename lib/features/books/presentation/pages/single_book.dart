import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:rockapp/app/styles/colors.dart';
import 'package:rockapp/app/styles/text_styles.dart';
import 'package:rockapp/app/styles/touchable_opacity.dart';
import 'package:rockapp/core/constant/constant.dart';
import 'package:rockapp/view_models/home/settings_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SingleBook extends StatefulWidget {
  const SingleBook({Key? key}) : super(key: key);

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
                          Image.asset(AppAssets.sampleBook),
                          const Gap(20),
                          const BodyText(
                            'Who is God',
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: AppColors.darkBlack,
                          ),
                          const Gap(12),
                          const BodyText(
                            'Rev Sam Morren',
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
                          const LongText(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tellus odio eros adipiscing tristique. Eu, egestas massa morbi eget purus amet. Volutpat, tincidunt tincidunt mattis faucibus arcu sed. Cursus nisl sit tincidunt mattis dictum turpis. Sit nullam risus, tincidunt gravida adipiscing cras.',
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
