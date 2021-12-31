import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rockapp/app/styles/colors.dart';
import 'package:rockapp/core/constant/app_assets.dart';

import 'package:rockapp/view_models/splash/splash_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: ViewModelBuilder<SplashViewModel>.nonReactive(
            viewModelBuilder: () => SplashViewModel(),
            onModelReady: (model) => model.init(context: context),
            builder: (context, model, child) {
              return Center(
                child: SizedBox(
                  width: 190,
                  height: 95,
                  child: Image.asset(AppAssets.appLogo),
                ),
              );
            }),
      ),
    );
  }
}
