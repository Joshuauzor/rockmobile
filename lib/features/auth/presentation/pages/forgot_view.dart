import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rockapp/app/styles/colors.dart';
import 'package:rockapp/app/styles/touchable_opacity.dart';
import 'package:rockapp/app/styles/ui_helpers.dart';
import 'package:rockapp/app/views/widgets/next_button.dart';
import 'package:rockapp/core/constant/app_assets.dart';

class ForgotView extends StatefulWidget {
  const ForgotView({Key? key}) : super(key: key);

  @override
  _ForgotViewState createState() => _ForgotViewState();
}

class _ForgotViewState extends State<ForgotView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isHidden = true;

  void _handlehidden() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

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
                      children: [
                        const Gap(80),
                        TextFormField(
                          validator: (value) {},
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: 'Enter email or username',
                            // suffixIcon: Icon(
                            //   Icons.visibility,
                            // ),
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
                              // fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const Gap(59),
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
