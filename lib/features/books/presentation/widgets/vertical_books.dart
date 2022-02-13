import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:rockapp/app/styles/colors.dart';
import 'package:rockapp/app/styles/text_styles.dart';
import 'package:rockapp/core/constant/constant.dart';
import 'package:rockapp/model/books.dart';

class VerticalBooks extends StatelessWidget {
  const VerticalBooks({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Books item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
        right: 30,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          item.bookCover == null
              ? Image.asset(
                  AppAssets.sampleBook,
                )
              : CachedNetworkImage(
                  imageUrl: item.bookCover,
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      width: 60,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  placeholder: (context, url) =>
                      Image.asset(AppAssets.sampleBook),
                  errorWidget: (context, url, error) => Image.asset(
                    AppAssets.sampleBook,
                  ),
                ),
          const Gap(20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LongText(
                  item.title,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.darkBlack,
                ),
                const Gap(3.84),
                LongText(
                  item.author,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.darkBlacklight,
                ),
              ],
            ),
          ),
          SvgPicture.asset(AppAssets.bookmark),
        ],
      ),
    );
  }
}
