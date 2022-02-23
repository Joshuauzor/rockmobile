import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rockapp/app/styles/colors.dart';
import 'package:rockapp/app/styles/text_styles.dart';
import 'package:rockapp/core/constant/app_assets.dart';

class DonationBox extends StatelessWidget {
  const DonationBox({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.uuid,
    Key? key,
  }) : super(key: key);

  final int id;
  final String title;
  final String description;
  final String image;
  final String uuid;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 21,
        left: 18,
        right: 14,
        bottom: 10,
      ),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            spreadRadius: 0,
            color: AppColors.homeMenuBox,
            offset: Offset(0, 8),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleText(
                  title,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: AppColors.lighterDark,
                ),
                const Gap(13),
                TitleText(
                  description,
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  color: AppColors.lighterDark,
                  maxLines: 6,
                ),
              ],
            ),
          ),
          const Gap(10),
          CachedNetworkImage(
            height: 123,
            width: 132,
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
            placeholder: (context, url) => Image.asset(AppAssets.exodus),
            errorWidget: (context, url, error) => Image.asset(AppAssets.exodus),
          )
        ],
      ),
    );
  }
}
