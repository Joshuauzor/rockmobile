import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:rockapp/app/styles/text_styles.dart';
import 'package:rockapp/app/styles/touchable_opacity.dart';
import 'package:rockapp/core/constant/constant.dart';
import 'package:rockapp/core/navigators/navigators.dart';
import 'package:rockapp/view_models/home/home_viewmodel.dart';
import 'package:rockapp/view_models/home/settings_viewmodel.dart';
import 'package:stacked/stacked.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ViewModelBuilder<SettingsViewModel>.reactive(
            viewModelBuilder: () => SettingsViewModel(),
            builder: (context, model, child) {
              return SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 121,
                          ),
                          const TitleText(
                            'Settings',
                            fontSize: 24,
                            textAlign: TextAlign.center,
                          ),
                          Image.asset(AppAssets.generallogo),
                        ],
                      ),
                      const Gap(51),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 21),
                        child: Divider(),
                      ),
                      const Gap(66),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 46,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const TitleText(
                                  'Change password',
                                  fontSize: 20,
                                  textAlign: TextAlign.left,
                                ),
                                SvgPicture.asset(AppAssets.arrowright)
                              ],
                            ),
                            const Gap(37),
                            TouchableOpacity(
                              onTap: () => Navigator.pushNamed(
                                context,
                                Routes.about,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const TitleText(
                                    'About us',
                                    fontSize: 20,
                                    textAlign: TextAlign.left,
                                  ),
                                  SvgPicture.asset(AppAssets.arrowright)
                                ],
                              ),
                            ),
                            const Gap(37),
                            TouchableOpacity(
                              onTap: () => Navigator.pushNamed(
                                context,
                                Routes.privacyPolicy,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const TitleText(
                                    'Privacy policy',
                                    fontSize: 20,
                                    textAlign: TextAlign.left,
                                  ),
                                  SvgPicture.asset(AppAssets.arrowright)
                                ],
                              ),
                            ),
                            const Gap(37),
                            TouchableOpacity(
                              onTap: () => Navigator.pushNamed(
                                context,
                                Routes.terms,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const TitleText(
                                    'Terms and conditions',
                                    fontSize: 20,
                                    textAlign: TextAlign.left,
                                  ),
                                  SvgPicture.asset(AppAssets.arrowright)
                                ],
                              ),
                            ),
                            const Gap(65),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 21),
                        child: Divider(),
                      ),
                      const Gap(39),
                      TouchableOpacity(
                        onTap: () async => {
                          await model.logout(context),
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 47),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const TitleText(
                                'Logout',
                                fontSize: 20,
                                textAlign: TextAlign.left,
                              ),
                              SvgPicture.asset(AppAssets.logout)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
