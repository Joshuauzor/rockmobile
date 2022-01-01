import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rockapp/app/styles/colors.dart';
import 'package:rockapp/app/styles/ui_helpers.dart';
import 'package:rockapp/app/views/widgets/next_button.dart';
import 'package:rockapp/core/constant/app_assets.dart';

import '../../../../app/styles/fonts.dart';

class ResetView extends StatefulWidget {
  const ResetView({Key? key}) : super(key: key);

  @override
  _ResetViewState createState() => _ResetViewState();
}

class _ResetViewState extends State<ResetView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
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
                          'Reset Password',
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                        const Gap(3),
                        const BodyText(
                          'Please enter your new password below',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.lightAsh,
                        ),
                        const Gap(37),
                        TextFormField(
                          validator: (value) {},
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: 'Password',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffEAEAF5),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffEAEAF5),
                              ),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffEAEAF5),
                              ),
                            ),
                            hintStyle: TextStyle(
                              color: Color(0xffA8A7A7),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const Gap(24),
                        TextFormField(
                          validator: (value) {},
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: 'Confirm Password',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffEAEAF5),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffEAEAF5),
                              ),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffEAEAF5),
                              ),
                            ),
                            hintStyle: TextStyle(
                              color: Color(0xffA8A7A7),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const Gap(94),
                        NextButton(label: 'Submit', onPressed: () {}),
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
    );
  }
}
