import 'dart:async';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:rockapp/app/styles/colors.dart';
import 'package:rockapp/app/styles/text_styles.dart';
import 'package:rockapp/app/styles/touchable_opacity.dart';
import 'package:rockapp/core/constant/constant.dart';
import 'package:rockapp/view_models/home/books_viewmodel.dart';
import 'package:stacked/stacked.dart';

class RockWebView extends StatefulWidget {
  final RockWebViewArgs params;
  const RockWebView({Key? key, required this.params}) : super(key: key);

  @override
  _RockWebViewState createState() => _RockWebViewState();
}

class _RockWebViewState extends State<RockWebView> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelBuilder<BooksViewModel>.reactive(
        viewModelBuilder: () => BooksViewModel(),
        builder: (context, model, child) {
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 29, right: 29),
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
                    ],
                  ),
                ),
                const Gap(13),
                Expanded(
                  child: WebView(
                    initialUrl: widget.params.url,
                    javascriptMode: JavascriptMode.unrestricted,
                    onWebViewCreated: (WebViewController webViewController) {
                      _controller.complete(webViewController);
                    },
                    gestureNavigationEnabled: true,
                    backgroundColor: AppColors.background,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class RockWebViewArgs {
  final dynamic uuid;
  final String title;
  final String url;

  RockWebViewArgs({
    required this.uuid,
    required this.title,
    required this.url,
  });
}
