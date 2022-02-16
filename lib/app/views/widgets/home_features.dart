import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rockapp/app/styles/colors.dart';
import 'package:rockapp/app/styles/text_styles.dart';
import 'package:rockapp/core/constant/app_assets.dart';

class HomeFeatures extends StatelessWidget {
  const HomeFeatures({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(12),
          topLeft: Radius.circular(12),
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            spreadRadius: 0,
            offset: Offset(0, 8),
            color: AppColors.homeMenuBox,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 16.96,
          bottom: 10.3,
        ),
        child: Column(
          children: [
            Container(
              height: 41.46,
              width: 41.46,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                    spreadRadius: 0,
                    offset: Offset(0, 8),
                    color: AppColors.homeMenuBoxIcon,
                  )
                ],
              ),
              child: Image.asset(icon),
            ),
            const Gap(13.58),
            BodyText(
              title,
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}

class ChurchPrayersHolder extends StatelessWidget {
  const ChurchPrayersHolder({
    required this.title,
    this.icon = AppAssets.churchPrayers,
    Key? key,
  }) : super(key: key);

  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding:
              const EdgeInsets.only(left: 22, top: 13, bottom: 13, right: 12),
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 8,
                spreadRadius: 0,
                offset: Offset(0, 8),
                color: AppColors.homeMenuBox,
              ),
            ],
            color: AppColors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HeaderText(
                title,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
              Image.asset(icon),
            ],
          ),
        ),
        const Gap(33),
      ],
    );
  }
}
