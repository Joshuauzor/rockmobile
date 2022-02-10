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
  PlayingState _playerState = PlayingState.idle;

  int maxduration = 100;
  int currentpos = 0;
  String currentpostlabel = "00:00";

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      audioPlayer.onDurationChanged.listen((Duration d) {
        //get the duration of audio
        maxduration = d.inMilliseconds;
      });

      audioPlayer.onAudioPositionChanged.listen((Duration p) {
        //get the current position of playing audio
        currentpos = p.inMilliseconds;

        //generating the duration label
        int shours = Duration(milliseconds: currentpos).inHours;
        int sminutes = Duration(milliseconds: currentpos).inMinutes;
        int sseconds = Duration(milliseconds: currentpos).inSeconds;

        // int rhours = shours;
        // int rminutes = sminutes - (shours * 60);
        int rminutes = sminutes;
        int rseconds = sseconds - (sminutes * 60 + shours * 60 * 60);

        currentpostlabel = "$rminutes:$rseconds";
        setState(() {
          //refresh the UI
        });
      });
    });
    super.initState();
  }

  void _handlePlaying() {
    setState(() {
      _playerState = _playerState == PlayingState.idle
          ? PlayingState.playing
          : _playerState == PlayingState.playing
              ? PlayingState.pause
              : PlayingState.playing;
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
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
                      Slider(
                        activeColor: AppColors.primaryColor,
                        value: double.parse(currentpos.toString()),
                        min: 0,
                        max: double.parse(maxduration.toString()),
                        divisions: maxduration,
                        label: currentpostlabel,
                        onChanged: (double value) async {
                          int seekval = value.round();
                          await audioPlayer
                              .seek(Duration(milliseconds: seekval));
                          //seek successful
                          currentpos = seekval;
                        },
                      ),
                      const Gap(6),
                      HeaderText(
                        currentpostlabel,
                        fontSize: 16,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 59,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        AppAssets.repeat,
                      ),
                      SvgPicture.asset(
                        AppAssets.previous,
                      ),
                      TouchableOpacity(
                        onTap: () async {
                          _playerState == PlayingState.idle
                              ? await audioPlayer.play(
                                  widget.params.media,
                                )
                              : _playerState == PlayingState.playing
                                  ? await audioPlayer.pause()
                                  : await audioPlayer.resume();
                          _handlePlaying();
                        },
                        child: Container(
                          width: 64,
                          height: 64,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryColor,
                          ),
                          child: PlayingState.idle == _playerState
                              ? Image.asset(
                                  AppAssets.playwhite,
                                )
                              : _playerState == PlayingState.playing
                                  ? Image.asset(
                                      AppAssets.pausewhite,
                                    )
                                  : Image.asset(
                                      AppAssets.playwhite,
                                    ),
                        ),
                      ),
                      SvgPicture.asset(
                        AppAssets.next,
                      ),
                      SvgPicture.asset(
                        AppAssets.volumeUp,
                      ),
                    ],
                  ),
                ),
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
