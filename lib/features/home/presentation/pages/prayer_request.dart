import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:rockapp/app/app.dart';
import 'package:rockapp/app/styles/colors.dart';
import 'package:rockapp/app/styles/text_styles.dart';
import 'package:rockapp/app/styles/touchable_opacity.dart';
import 'package:rockapp/app/styles/validation.dart';
import 'package:rockapp/app/views/widgets/text_field.dart';
import 'package:rockapp/core/constant/constant.dart';
import 'package:rockapp/view_models/home/settings_viewmodel.dart';
import 'package:stacked/stacked.dart';

class PrayerRequest extends StatefulWidget {
  const PrayerRequest({Key? key}) : super(key: key);

  @override
  _PrayerRequestState createState() => _PrayerRequestState();
}

class _PrayerRequestState extends State<PrayerRequest> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _requestController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _requestController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelBuilder<SettingsViewModel>.reactive(
        viewModelBuilder: () => SettingsViewModel(),
        builder: (context, model, child) {
          return SafeArea(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
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
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Gap(4),
                            const HeaderText(
                              'Prayer Request',
                              color: AppColors.primaryColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.left,
                            ),
                            const Gap(12),
                            const TitleText(
                              'Do you need prayers?',
                              color: AppColors.lighterDark,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            const Gap(9),
                            const TitleText(
                              'Complete the form below to submit your prayer request and one of our Prayer Ministers will pray in agreement with you.',
                              color: AppColors.lightestDark,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              maxLines: 3,
                            ),
                            const Gap(33),
                            const BodyText(
                              'Name',
                              fontWeight: FontWeight.w500,
                              color: AppColors.lighterDark,
                            ),
                            const Gap(12),
                            DecoratedTextField(
                              nameController: _nameController,
                              hintText: 'Enter your full name here',
                              validation: validateText,
                            ),
                            const Gap(10),
                            const BodyText(
                              'Email',
                              fontWeight: FontWeight.w500,
                              color: AppColors.lighterDark,
                            ),
                            const Gap(12),
                            DecoratedTextField(
                              nameController: _emailController,
                              hintText: 'Enter your email address',
                              validation: validateEmail,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const Gap(10),
                            const BodyText(
                              'Phone',
                              fontWeight: FontWeight.w500,
                              color: AppColors.lighterDark,
                            ),
                            const Gap(12),
                            DecoratedTextField(
                              nameController: _phoneController,
                              hintText: 'Enter your phone number',
                              validation: validateEmail,
                              keyboardType: TextInputType.number,
                            ),
                            const Gap(10),
                            const BodyText(
                              'Request',
                              fontWeight: FontWeight.w500,
                              color: AppColors.lighterDark,
                            ),
                            const Gap(12),
                            Container(
                              height: 132,
                              decoration: const BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(6),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.inputBox,
                                    blurRadius: 8,
                                    spreadRadius: 0,
                                    offset: Offset(0, 3),
                                  )
                                ],
                              ),
                              child: TextFormField(
                                controller: _requestController,
                                keyboardType: TextInputType.multiline,
                                validator: validateText,
                                // expands: true,
                                maxLines: null,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                    left: 11,
                                    top: 18,
                                    bottom: 18,
                                  ),
                                  hintText: 'Enter your prayer request...',
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    color: AppColors.hintTextColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                            const Gap(27),
                            NextButton(
                              label: 'Request Prayer',
                              disabled: model.busy,
                              busy: model.busy,
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  // await model.login(
                                  //   email: _emailController.text.trim(),
                                  //   password: _passwordController.text.trim(),
                                  //   context: context,
                                  // );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
