import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:rockapp/app/styles/colors.dart';
import 'package:rockapp/app/styles/text_styles.dart';
import 'package:rockapp/app/styles/touchable_opacity.dart';
import 'package:rockapp/core/constant/constant.dart';
import 'package:rockapp/view_models/home/media_viewmodel.dart';
import 'package:stacked/stacked.dart';

class VideoPlayerView extends StatefulWidget {
  final VideoPlayerViewsArgs params;
  const VideoPlayerView({
    Key? key,
    required this.params,
  }) : super(key: key);

  @override
  _VideoPlayerViewState createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelBuilder<MediaViewModel>.reactive(
        viewModelBuilder: () => MediaViewModel(),
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
                const Gap(11.34),
                // Expanded(
                //   child: AspectRatio(
                //     aspectRatio: 16 / 9,
                //     child: BetterPlayer.network(
                //       widget.params.media,
                //       betterPlayerConfiguration: BetterPlayerConfiguration(
                //         aspectRatio: 16 / 9,
                //       ),
                //     ),
                //   ),
                // ),
                const Gap(88),
              ],
            ),
          );
        },
      ),
    );
  }
}

enum PlayingState {
  idle,
  playing,
  pause,
}

class VideoPlayerViewsArgs {
  final String coverImage;
  final String title;
  final String media;
  final String author;

  VideoPlayerViewsArgs({
    required this.coverImage,
    required this.title,
    required this.media,
    required this.author,
  });
}
