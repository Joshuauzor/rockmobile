import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rockapp/app/styles/colors.dart';
import 'package:rockapp/app/styles/touchable_opacity.dart';
import 'package:rockapp/app/styles/ui_helpers.dart';
import 'package:rockapp/app/styles/validation.dart';
import 'package:rockapp/app/views/widgets/next_button.dart';
import 'package:rockapp/core/constant/app_assets.dart';
import 'package:rockapp/view_models/auth/login_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/styles/text_styles.dart';

class ForgotView extends StatefulWidget {
  const ForgotView({Key? key}) : super(key: key);

  @override
  _ForgotViewState createState() => _ForgotViewState();
}

class _ForgotViewState extends State<ForgotView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) {
        return SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: SizedBox(
              height: screenHeight(context) - 150,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.35,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                        ),
                        child: Image.asset(AppAssets.appLogo),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 230,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x4DBEB5E1),
                              offset: Offset(0, 10),
                              blurRadius: 15,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 31, right: 31),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Gap(73),
                              const BodyText(
                                'Forgot Password?',
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                maxLines: 2,
                              ),
                              const Gap(3),
                              const BodyText(
                                'Please enter your registered email below',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.lightAsh,
                                maxLines: 2,
                              ),
                              const Gap(37),
                              TextFormField(
                                controller: _emailController,
                                validator: validateEmail,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  hintText: 'Enter email',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.lowerHome,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.lowerHome,
                                    ),
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.lowerHome,
                                    ),
                                  ),
                                  hintStyle: TextStyle(
                                    color: AppColors.lightAsh,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              const Gap(13),
                              TouchableOpacity(
                                onTap: () => Navigator.pop(context),
                                child: const Align(
                                  alignment: Alignment.bottomRight,
                                  child: BodyText(
                                    'Back to login',
                                    color: AppColors.lightAsh,
                                    textAlign: TextAlign.end,
                                    fontSize: 8,
                                  ),
                                ),
                              ),
                              const Gap(59),
                              NextButton(
                                busy: model.busy,
                                disabled: model.busy,
                                label: 'Submit',
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    await model.forgotPassword(
                                      email: _emailController.text.trim(),
                                      context: context,
                                    );
                                  }
                                },
                              ),
                              SizedBox(
                                height: screenHeight(context) * 0.05,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}
