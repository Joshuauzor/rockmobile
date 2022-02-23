import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:rockapp/app/styles/colors.dart';
import 'package:rockapp/app/styles/text_styles.dart';
import 'package:rockapp/app/styles/touchable_opacity.dart';
import 'package:rockapp/app/views/views.dart';
import 'package:rockapp/app/views/widgets/password_field.dart';
import 'package:rockapp/core/constant/constant.dart';
import 'package:rockapp/view_models/home/settings_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _currentPassword = TextEditingController();
  final _newPassword = TextEditingController();
  final _confirmPassword = TextEditingController();

  @override
  void dispose() {
    _currentPassword.dispose();
    _newPassword.dispose();
    _confirmPassword.dispose();
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
              padding: const EdgeInsets.symmetric(horizontal: 30),
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
                  const Gap(44),
                  const HeaderText(
                    'Change Password',
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
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Gap(19),
                            const BodyText(
                              'Please enter your details to change password',
                              color: AppColors.lighterAsh,
                            ),
                            const Gap(59),
                            PasswordField(
                              controller: _currentPassword,
                              hintText: 'Current Password',
                            ),
                            const Gap(28),
                            PasswordField(
                              controller: _newPassword,
                              hintText: 'New Password',
                            ),
                            const Gap(28),
                            PasswordField(
                              controller: _confirmPassword,
                              hintText: 'Confirm Password',
                            ),
                            const Gap(80),
                            NextButton(
                              label: 'Change Password',
                              disabled: model.busy,
                              busy: model.busy,
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  await model.resetPassword(
                                    currentPassword:
                                        _currentPassword.text.trim(),
                                    newPassword: _newPassword.text.trim(),
                                    confirmPassword:
                                        _confirmPassword.text.trim(),
                                    context: context,
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
