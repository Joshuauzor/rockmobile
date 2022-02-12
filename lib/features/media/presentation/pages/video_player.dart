import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:rockapp/app/styles/colors.dart';
import 'package:rockapp/app/styles/text_styles.dart';
import 'package:rockapp/app/styles/touchable_opacity.dart';
import 'package:rockapp/core/constant/constant.dart';
import 'package:rockapp/view_models/home/media_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:video_player/video_player.dart';

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
  late FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(widget.params.media),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelBuilder<MediaViewModel>.reactive(
        viewModelBuilder: () => MediaViewModel(),
        builder: (context, model, child) {
          return SafeArea(
            child: SingleChildScrollView(
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
                  FlickVideoPlayer(flickManager: flickManager),
                  const Gap(20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 29),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleText(
                          widget.params.title,
                          color: AppColors.black,
                        ),
                        const Gap(8),
                        LongText(
                          widget.params.description,
                        )
                      ],
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
  final String description;

  VideoPlayerViewsArgs({
    required this.coverImage,
    required this.title,
    required this.media,
    required this.author,
    required this.description,
  });
}
