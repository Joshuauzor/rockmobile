import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:rockapp/app/styles/colors.dart';
import 'package:rockapp/app/styles/text_styles.dart';
import 'package:rockapp/app/styles/touchable_opacity.dart';
import 'package:rockapp/core/constant/constant.dart';
import 'package:rockapp/view_models/home/settings_viewmodel.dart';
import 'package:stacked/stacked.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelBuilder<SettingsViewModel>.reactive(
        viewModelBuilder: () => SettingsViewModel(),
        builder: (context, model, child) {
          return SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
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
                ),
                const Gap(44),
                const HeaderText(
                  'About Us',
                  color: AppColors.primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                const Gap(11),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 21),
                  child: Divider(),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Gap(19),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 31),
                          child: LongText(
                            '${model.settings!.description}',
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
