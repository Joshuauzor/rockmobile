import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:rockapp/app/styles/colors.dart';
import 'package:rockapp/app/styles/text_styles.dart';
import 'package:rockapp/app/styles/touchable_opacity.dart';
import 'package:rockapp/core/constant/constant.dart';
import 'package:rockapp/core/navigators/routes.dart';
import 'package:rockapp/features/media/presentation/pages/video_player.dart';

class VideoMedia extends StatelessWidget {
  const VideoMedia({
    required this.image,
    required this.title,
    required this.author,
    required this.media,
    required this.description,
    Key? key,
  }) : super(key: key);

  final String image;
  final String title;
  final String author;
  final String media;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 220,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 8),
            blurRadius: 8,
            spreadRadius: 0,
            color: AppColors.homeMenuBox,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: image,
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
                      AppAssets.sampleBook,
                      color: AppColors.black,
                    ),
                    errorWidget: (context, url, error) => Image.asset(
                      AppAssets.sampleBook,
                      color: AppColors.black,
                    ),
                  ),
                  Positioned(
                    top: 69,
                    left: 0,
                    right: 0,
                    child: TouchableOpacity(
                      onTap: () => Navigator.pushNamed(
                        context,
                        Routes.videoPlayerView,
                        arguments: VideoPlayerViewsArgs(
                          coverImage: image,
                          title: title,
                          media: media,
                          author: author,
                          description: description,
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(12.93),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.white,
                        ),
                        child: SvgPicture.asset(
                          AppAssets.play,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Gap(3),
          Padding(
            padding: const EdgeInsets.only(left: 7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleText(
                  title,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
                const Gap(3),
                BodyText(
                  author,
                  fontSize: 6,
                  fontWeight: FontWeight.w300,
                  color: AppColors.black,
                ),
              ],
            ),
          ),
          const Gap(17),
        ],
      ),
    );
  }
}
