import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:rockapp/app/styles/colors.dart';
import 'package:rockapp/app/styles/fonts.dart';
import 'package:rockapp/core/constant/app_assets.dart';
import 'package:rockapp/core/constant/constant.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List slider = [AppAssets.intersect, AppAssets.intersect, AppAssets.intersect];
  int _current = 0;
  final CarouselController _controller = CarouselController();

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
            topLeft: Radius.circular(12),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
          child: BottomNavigationBar(
            backgroundColor: AppColors.primaryColor,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(AppAssets.audio),
                ),
                label: '',
                backgroundColor: AppColors.primaryColor,
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(AppAssets.bible),
                ),
                label: '',
                backgroundColor: AppColors.primaryColor,
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(AppAssets.home),
                ),
                label: '',
                backgroundColor: AppColors.primaryColor,
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(AppAssets.music),
                ),
                label: '',
                backgroundColor: AppColors.primaryColor,
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(AppAssets.settings),
                ),
                label: '',
                backgroundColor: AppColors.primaryColor,
              ),
            ],
            // currentIndex: _selectedIndex,
            selectedFontSize: 0,
            unselectedFontSize: 0,
            selectedItemColor: AppColors.lightGold,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            // onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
