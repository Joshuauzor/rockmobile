import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rockapp/app/styles/colors.dart';
import 'package:rockapp/app/styles/touchable_opacity.dart';
import 'package:rockapp/app/styles/ui_helpers.dart';
import 'package:rockapp/app/styles/validation.dart';
import 'package:rockapp/app/views/widgets/next_button.dart';
import 'package:rockapp/core/constant/app_assets.dart';
import 'package:rockapp/core/navigators/navigators.dart';
import 'package:rockapp/view_models/auth/login_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/styles/text_styles.dart';

class ResetView extends StatefulWidget {
  final ResetViewArgs params;
  const ResetView({required this.params, Key? key}) : super(key: key);

  @override
  _ResetViewState createState() => _ResetViewState();
}

class _ResetViewState extends State<ResetView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isHidden = true;
  bool _isHidden1 = true;

  void _handlehidden() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void _handlehidden1() {
    setState(() {
      _isHidden1 = !_isHidden1;
    });
  }

  @override
  void dispose() {
    _otpController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
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
                                controller: _otpController,
                                validator: validateOtp,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  hintText: 'Enter otp',
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
                              const Gap(30),
                              TextFormField(
                                controller: _newPasswordController,
                                validator: validatePassword,
                                obscureText: _isHidden1,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                  hintText: 'Enter New Password',
                                  suffixIcon: TouchableOpacity(
                                    onTap: () {
                                      _handlehidden1();
                                    },
                                    child: Icon(
                                      _isHidden1
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      size: 16,
                                    ),
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.lowerHome,
                                    ),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.lowerHome,
                                    ),
                                  ),
                                  border: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.lowerHome,
                                    ),
                                  ),
                                  hintStyle: const TextStyle(
                                    color: AppColors.lightAsh,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              const Gap(30),
                              TextFormField(
                                controller: _confirmPasswordController,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return '*required';
                                  }
                                  if (val !=
                                      _newPasswordController.text.trim()) {
                                    return 'Both password do not match';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: _isHidden,
                                decoration: InputDecoration(
                                  hintText: 'Confirm new password',
                                  suffixIcon: TouchableOpacity(
                                    onTap: () {
                                      _handlehidden();
                                    },
                                    child: Icon(
                                      _isHidden
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      size: 16,
                                    ),
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.lowerHome,
                                    ),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.lowerHome,
                                    ),
                                  ),
                                  border: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.lowerHome,
                                    ),
                                  ),
                                  hintStyle: const TextStyle(
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
                                    await model.resetPassword(
                                      email: widget.params.email,
                                      otp: _otpController.text.trim(),
                                      password:
                                          _newPasswordController.text.trim(),
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

class ResetViewArgs {
  ResetViewArgs({
    required this.email,
  });
  final String email;
}
