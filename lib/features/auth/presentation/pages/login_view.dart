import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rockapp/app/styles/colors.dart';
import 'package:rockapp/app/styles/text_styles.dart';
import 'package:rockapp/app/styles/touchable_opacity.dart';
import 'package:rockapp/app/styles/ui_helpers.dart';
import 'package:rockapp/app/styles/validation.dart';
import 'package:rockapp/app/views/widgets/next_button.dart';
import 'package:rockapp/core/constant/app_assets.dart';
import 'package:rockapp/core/navigators/routes.dart';
import 'package:rockapp/view_models/auth/login_viewmodel.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _registerEmailController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _registerPasswordController = TextEditingController();

  bool _isHidden = true;
  bool authTypeLogin = true;

  void _handlehidden() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _registerEmailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _registerPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, model, child) {
          return SingleChildScrollView(
            child: SizedBox(
              height: screenHeight(context) - 150,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.25,
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
                  authTypeLogin
                      ? Positioned(
                          // top: 230,
                          top: MediaQuery.of(context).size.height * 0.17,
                          // bottom: MediaQuery.of(context).size.height * 0.17,
                          left: 0,
                          right: 0,
                          child: Form(
                            key: _formKey,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 28),
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
                                  padding: const EdgeInsets.only(
                                      left: 31, right: 31),
                                  child: Column(
                                    children: [
                                      const Gap(55),
                                      Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0x268163D6),
                                              offset: Offset(0, 8),
                                              blurRadius: 8,
                                              spreadRadius: 0,
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                height: 39,
                                                decoration: const BoxDecoration(
                                                  color: AppColors.primaryColor,
                                                  shape: BoxShape.rectangle,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomLeft:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10),
                                                  ),
                                                ),
                                                child: const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 10,
                                                  ),
                                                  child: BodyText(
                                                    'Login',
                                                    color: AppColors.white,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    authTypeLogin =
                                                        !authTypeLogin;
                                                  });
                                                },
                                                child: Container(
                                                  height: 39,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.white,
                                                    shape: BoxShape.rectangle,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(30),
                                                      topRight:
                                                          Radius.circular(30),
                                                      bottomLeft:
                                                          Radius.circular(30),
                                                      bottomRight:
                                                          Radius.circular(30),
                                                    ),
                                                  ),
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      vertical: 10,
                                                    ),
                                                    child: BodyText(
                                                      'Sign Up',
                                                      color: AppColors
                                                          .primaryColor,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Gap(80),
                                      TextFormField(
                                        validator: validateEmail,
                                        controller: _emailController,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: const InputDecoration(
                                          hintText: 'Enter email or username',
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
                                      const Gap(30),
                                      TextFormField(
                                        validator: validateText,
                                        controller: _passwordController,
                                        keyboardType: TextInputType.text,
                                        obscureText: _isHidden,
                                        decoration: InputDecoration(
                                          hintText: 'Password',
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
                                          enabledBorder:
                                              const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xffEAEAF5),
                                            ),
                                          ),
                                          focusedBorder:
                                              const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xffEAEAF5),
                                            ),
                                          ),
                                          border: const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xffEAEAF5),
                                            ),
                                          ),
                                          hintStyle: const TextStyle(
                                            color: Color(0xffA8A7A7),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      const Gap(13),
                                      GestureDetector(
                                        onTap: () => Navigator.pushNamed(
                                          context,
                                          Routes.forgotView,
                                        ),
                                        child: const Align(
                                          alignment: Alignment.bottomRight,
                                          child: BodyText(
                                            'Forgot Password?',
                                            color: AppColors.lightAsh,
                                            textAlign: TextAlign.end,
                                            fontSize: 8,
                                          ),
                                        ),
                                      ),
                                      const Gap(59),
                                      NextButton(
                                        label: 'Log In',
                                        disabled: model.busy,
                                        busy: model.busy,
                                        onPressed: () async {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            await model.login(
                                                email: _emailController.text
                                                    .trim(),
                                                password: _passwordController
                                                    .text
                                                    .trim(),
                                                context: context);
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
                          ),
                        )
                      : Positioned(
                          top: MediaQuery.of(context).size.height * 0.17,
                          left: 0,
                          right: 0,
                          child: Form(
                            key: _formKey2,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 28),
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
                                  padding: const EdgeInsets.only(
                                      left: 31, right: 31),
                                  child: Column(
                                    children: [
                                      const Gap(55),
                                      Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0x268163D6),
                                              offset: Offset(0, 8),
                                              blurRadius: 8,
                                              spreadRadius: 0,
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    authTypeLogin =
                                                        !authTypeLogin;
                                                  });
                                                },
                                                child: Container(
                                                  height: 39,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.white,
                                                    shape: BoxShape.rectangle,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(30),
                                                      topRight:
                                                          Radius.circular(30),
                                                      bottomLeft:
                                                          Radius.circular(30),
                                                      bottomRight:
                                                          Radius.circular(30),
                                                    ),
                                                  ),
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      vertical: 10,
                                                    ),
                                                    child: BodyText(
                                                      'Login',
                                                      color: AppColors
                                                          .primaryColor,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                height: 39,
                                                decoration: const BoxDecoration(
                                                  color: AppColors.primaryColor,
                                                  shape: BoxShape.rectangle,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomLeft:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10),
                                                  ),
                                                ),
                                                child: const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 10,
                                                  ),
                                                  child: BodyText(
                                                    'Sign Up',
                                                    color: AppColors.white,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Gap(80),
                                      TextFormField(
                                        validator: validateText,
                                        controller: _firstNameController,
                                        keyboardType: TextInputType.text,
                                        decoration: const InputDecoration(
                                          hintText: 'Enter First Name',
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
                                      const Gap(24),
                                      TextFormField(
                                        validator: validateText,
                                        controller: _lastNameController,
                                        keyboardType: TextInputType.text,
                                        decoration: const InputDecoration(
                                          hintText: 'Enter Last Name',
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
                                      const Gap(24),
                                      TextFormField(
                                        validator: validateEmail,
                                        controller: _registerEmailController,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: const InputDecoration(
                                          hintText: 'Enter email',
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
                                      const Gap(30),
                                      TextFormField(
                                        validator: validateText,
                                        controller: _registerPasswordController,
                                        keyboardType: TextInputType.text,
                                        obscureText: _isHidden,
                                        decoration: InputDecoration(
                                          hintText: 'Password',
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
                                          enabledBorder:
                                              const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xffEAEAF5),
                                            ),
                                          ),
                                          focusedBorder:
                                              const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xffEAEAF5),
                                            ),
                                          ),
                                          border: const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xffEAEAF5),
                                            ),
                                          ),
                                          hintStyle: const TextStyle(
                                            color: Color(0xffA8A7A7),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      const Gap(59),
                                      NextButton(
                                          label: 'Sign Up',
                                          disabled: model.busy,
                                          busy: model.busy,
                                          onPressed: () async {
                                            if (_formKey2.currentState!
                                                .validate()) {
                                              await model.register(
                                                email: _registerEmailController
                                                    .text
                                                    .trim(),
                                                firstName: _firstNameController
                                                    .text
                                                    .trim(),
                                                lastName: _lastNameController
                                                    .text
                                                    .trim(),
                                                password:
                                                    _registerPasswordController
                                                        .text
                                                        .trim(),
                                                context: context,
                                              );
                                            }
                                          }),
                                      SizedBox(
                                        height: screenHeight(context) * 0.05,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
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
