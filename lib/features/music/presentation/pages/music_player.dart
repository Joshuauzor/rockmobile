import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:rockapp/app/styles/colors.dart';
import 'package:rockapp/app/styles/text_styles.dart';
import 'package:rockapp/app/styles/touchable_opacity.dart';
import 'package:rockapp/core/constant/constant.dart';
import 'package:rockapp/view_models/home/music_viewmodel.dart';
import 'package:stacked/stacked.dart';

class MusicPlayerView extends StatefulWidget {
  final MusicPlayerViewsArgs params;
  const MusicPlayerView({
    Key? key,
    required this.params,
  }) : super(key: key);

  @override
  _MusicPlayerViewState createState() => _MusicPlayerViewState();
}

class _MusicPlayerViewState extends State<MusicPlayerView> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool _playing = false;
  bool _paused = true;

  void _handlePlaying() {
    setState(() {
      _playing = !_playing;
      _paused = !_paused;
      // notify listener
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelBuilder<MusicViewModel>.reactive(
          viewModelBuilder: () => MusicViewModel(),
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
                  Expanded(
                    child: CachedNetworkImage(
                      imageUrl: widget.params.coverImage,
                      imageBuilder: (context, imageProvider) {
                        return Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                      placeholder: (context, url) => Image.asset(
                        AppAssets.music,
                        color: AppColors.black,
                      ),
                      errorWidget: (context, url, error) => Image.asset(
                        AppAssets.music,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  const Gap(125.66),
                  Padding(
                    padding: const EdgeInsets.only(left: 29, right: 29),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeaderText(
                          widget.params.title,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                        const Gap(12),
                        Container(
                          width: double.infinity,
                          height: 10,
                          decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        const Gap(6),
                        const HeaderText(
                          '04:35',
                          fontSize: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 27,
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                AppAssets.repeat,
                              ),
                              const Gap(44),
                              SvgPicture.asset(
                                AppAssets.previous,
                              ),
                              const Gap(35),
                              TouchableOpacity(
                                onTap: () async {
                                  print(_playing);
                                  print(_paused);

                                  _playing
                                      ? await audioPlayer.pause()
                                      : _paused
                                          ? await audioPlayer.resume()
                                          : await audioPlayer.play(
                                              widget.params.media,
                                            );
                                  _handlePlaying();
                                },
                                child: Container(
                                  width: 64,
                                  height: 64,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.primaryColor,
                                  ),
                                  child: _playing
                                      ? Image.asset(
                                          AppAssets.pausewhite,
                                        )
                                      : model.busy
                                          ? const CircularProgressIndicator(
                                              color: AppColors.primaryColor,
                                            )
                                          : Image.asset(
                                              AppAssets.playwhite,
                                            ),
                                ),
                              ),
                              const Gap(35),
                              SvgPicture.asset(
                                AppAssets.next,
                              ),
                              const Gap(44),
                              SvgPicture.asset(
                                AppAssets.volumeUp,
                              ),
                            ],
                          ),
                        ),
                        const Gap(83),
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}

class MusicPlayerViewsArgs {
  final dynamic uuid;
  final String coverImage;
  final String title;
  final String media;
  final String author;

  MusicPlayerViewsArgs({
    required this.uuid,
    required this.coverImage,
    required this.title,
    required this.media,
    required this.author,
  });
}