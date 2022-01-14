import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:rockapp/app/styles/colors.dart';
import 'package:rockapp/app/styles/fonts.dart';
import 'package:rockapp/core/constant/app_assets.dart';
import 'package:rockapp/core/constant/constant.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List slider = [AppAssets.intersect, AppAssets.intersect, AppAssets.intersect];
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              ),
              color: AppColors.primaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 51,
                bottom: 8,
                left: 27,
                right: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        child: Image.asset(AppAssets.avatar),
                      ),
                      const Gap(11),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          BodyText(
                            'Hello Joseph',
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white,
                          ),
                          Gap(3),
                          BodyText(
                            'Good morning.',
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(AppAssets.bell),
                    ),
                  ),
                ],
              ),
            ),
          ),
          CarouselSlider(
            carouselController: _controller,
            options: CarouselOptions(
              height: 220,
              initialPage: 0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
            items: slider.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Image.asset(i),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: slider.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 7.0,
                  height: 7.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 3.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? AppColors.white
                            : AppColors.primaryColor)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4),
                  ),
                ),
              );
            }).toList(),
          ),
          const Gap(20.76),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 33.88),
            child: StaggeredGrid.count(
              crossAxisCount: 2,
              crossAxisSpacing: 23.56,
              mainAxisSpacing: 23.56,
              children: [
                Container(
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
                          child: Image.asset(AppAssets.reading),
                        ),
                        const Gap(13.58),
                        const BodyText(
                          'Daily Readings',
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
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
                          child: Image.asset(AppAssets.prayers),
                        ),
                        const Gap(13.58),
                        const BodyText(
                          'Church Prayers',
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
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
                          child: Image.asset(AppAssets.prayers),
                        ),
                        const Gap(13.58),
                        const BodyText(
                          'Church Prayers',
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
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
                          child: Image.asset(AppAssets.prayers),
                        ),
                        const Gap(13.58),
                        const BodyText(
                          'Church Prayers',
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
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
                          child: Image.asset(AppAssets.prayers),
                        ),
                        const Gap(13.58),
                        const BodyText(
                          'Church Prayers',
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
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
                          child: Image.asset(AppAssets.prayers),
                        ),
                        const Gap(13.58),
                        const BodyText(
                          'Church Prayers',
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
