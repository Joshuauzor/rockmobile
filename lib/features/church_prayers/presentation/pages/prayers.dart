import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:rockapp/app/styles/colors.dart';
import 'package:rockapp/app/styles/text_styles.dart';
import 'package:rockapp/app/styles/touchable_opacity.dart';
import 'package:rockapp/core/constant/constant.dart';
import 'package:rockapp/view_models/home/books_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ChurchPrayers extends StatefulWidget {
  const ChurchPrayers({Key? key}) : super(key: key);

  @override
  _ChurchPrayersState createState() => _ChurchPrayersState();
}

class _ChurchPrayersState extends State<ChurchPrayers> {
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
                              'Church Prayers',
                              color: AppColors.primaryColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Gap(20),
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
