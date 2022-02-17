import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:rockapp/app/styles/colors.dart';
import 'package:rockapp/app/styles/text_styles.dart';
import 'package:rockapp/app/styles/touchable_opacity.dart';
import 'package:rockapp/core/constant/constant.dart';
import 'package:rockapp/view_models/home/settings_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SelectReading extends StatefulWidget {
  const SelectReading({Key? key}) : super(key: key);

  @override
  _SelectReadingState createState() => _SelectReadingState();
}

class _SelectReadingState extends State<SelectReading> {
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
                  'Select date',
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
                  child: Column(
                    children: [
                      const Gap(19),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                            color: AppColors.white,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.calenderBox1,
                                blurRadius: 3,
                                spreadRadius: 0,
                                offset: Offset(0, 1),
                              ),
                              BoxShadow(
                                color: AppColors.calenderBox2,
                                blurRadius: 14,
                                spreadRadius: 0,
                                offset: Offset(0, 3),
                              ),
                              BoxShadow(
                                color: AppColors.calenderBox3,
                                blurRadius: 32,
                                spreadRadius: 0,
                                offset: Offset(0, 8),
                              ),
                              BoxShadow(
                                color: AppColors.calenderBox4,
                                blurRadius: 84,
                                spreadRadius: 0,
                                offset: Offset(0, 30),
                              )
                            ],
                          ),
                          child: SfDateRangePicker(
                            selectionColor: AppColors.primaryColor,
                            showActionButtons: true,
                            showNavigationArrow: true,
                            onCancel: () => Navigator.pop(context),
                            onSubmit: (value) {
                              print(value);
                            },
                          ),
                        ),
                      ),
                    ],
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
