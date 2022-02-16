import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:rockapp/app/styles/colors.dart';
import 'package:rockapp/app/styles/text_styles.dart';
import 'package:rockapp/app/styles/touchable_opacity.dart';
import 'package:rockapp/core/constant/constant.dart';

class MusicTile extends StatefulWidget {
  const MusicTile(
      {Key? key,
      required this.title,
      required this.coverImage,
      required this.media,
      required this.busy})
      : super(key: key);

  final String title;
  final String coverImage;
  final String media;
  final bool busy;

  @override
  State<MusicTile> createState() => _MusicTileState();
}

class _MusicTileState extends State<MusicTile> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool _playing = false;

  void _handlePlaying() {
    setState(() {
      _playing = !_playing;
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 27),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  spreadRadius: 0,
                  offset: Offset(0, 4),
                  color: AppColors.lightDark,
                ),
              ],
              color: AppColors.white,
            ),
            child: CachedNetworkImage(
              imageUrl: widget.coverImage,
              imageBuilder: (context, imageProvider) {
                return Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
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
          const Gap(8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BodyText(
                  widget.title,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
                const Gap(7),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        spreadRadius: 0,
                        offset: Offset(0, 4),
                        color: AppColors.lightDark,
                      ),
                    ],
                    color: AppColors.primaryColor,
                  ),
                  child: const BodyText(
                    'MP3',
                    color: AppColors.white,
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
          TouchableOpacity(
            onTap: () async {
              _playing
                  ? await audioPlayer.pause()
                  : await audioPlayer.play(
                      widget.media,
                    );
              _handlePlaying();
            },
            child: Container(
              padding: const EdgeInsets.all(17),
              width: 51,
              height: 53,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    spreadRadius: 0,
                    offset: Offset(0, 4),
                    color: AppColors.lightDark,
                  ),
                ],
                color: AppColors.milk,
              ),
              child: _playing
                  ? SvgPicture.asset(
                      AppAssets.pause,
                      width: 15,
                      height: 17.42,
                    )
                  : SvgPicture.asset(
                      AppAssets.play,
                      width: 15,
                      height: 17.42,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
