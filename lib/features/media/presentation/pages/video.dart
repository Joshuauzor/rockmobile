import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:rockapp/app/styles/colors.dart';
import 'package:rockapp/app/styles/fonts.dart';
import 'package:rockapp/app/views/widgets/bottom_navbar.dart';
import 'package:rockapp/core/constant/app_assets.dart';
import 'package:rockapp/core/constant/constant.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:rockapp/core/navigators/navigators.dart';

class VideoView extends StatefulWidget {
  const VideoView({Key? key}) : super(key: key);

  @override
  _VideoViewState createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
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
                            'Hello Video',
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
        ],
      ),
      bottomNavigationBar: FABBottomAppBar(
          items: [
            FABBottomAppBarItem(icon: AppAssets.audio, text: 'audio'),
            FABBottomAppBarItem(icon: AppAssets.bible, text: 'bible'),
            FABBottomAppBarItem(icon: AppAssets.home, text: 'home'),
            FABBottomAppBarItem(icon: AppAssets.music, text: 'music'),
            FABBottomAppBarItem(icon: AppAssets.settings, text: 'settings'),
          ],
          centerItemText: 'hello',
          backgroundColor: AppColors.primaryColor,
          color: AppColors.white,
          selectedColor: AppColors.grey,
          currentIndex: 1,
          notchedShape: const CircularNotchedRectangle(),
          onTabSelected: (value) => print('object')
          // Navigator.pushNamed(context, Routes.forgotView),
          ),
      // bottomNavigationBar: BottomAppBar(
      //   child: Row(
      //     mainAxisSize: MainAxisSize.max,
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: <Widget>[],
      //   ),
      //   color: Colors.blueGrey,
      // ),
      // bottomNavigationBar: Container(
      //   decoration: const BoxDecoration(
      //     borderRadius: BorderRadius.only(
      //       topRight: Radius.circular(12),
      //       topLeft: Radius.circular(12),
      //     ),
      //   ),
      //   child: ClipRRect(
      //     borderRadius: const BorderRadius.only(
      //       topLeft: Radius.circular(12.0),
      //       topRight: Radius.circular(12.0),
      //     ),
      //     child: BottomNavigationBar(
      //       backgroundColor: AppColors.primaryColor,
      //       items: const <BottomNavigationBarItem>[
      //         BottomNavigationBarItem(
      //           icon: ImageIcon(
      //             AssetImage(AppAssets.audio),
      //           ),
      //           label: '',
      //           backgroundColor: AppColors.primaryColor,
      //         ),
      //         BottomNavigationBarItem(
      //           icon: ImageIcon(
      //             AssetImage(AppAssets.bible),
      //           ),
      //           label: '',
      //           backgroundColor: AppColors.primaryColor,
      //         ),
      //         BottomNavigationBarItem(
      //           icon: ImageIcon(
      //             AssetImage(AppAssets.home),
      //           ),
      //           label: '',
      //           backgroundColor: AppColors.primaryColor,
      //         ),
      //         BottomNavigationBarItem(
      //           icon: ImageIcon(
      //             AssetImage(AppAssets.music),
      //           ),
      //           label: '',
      //           backgroundColor: AppColors.primaryColor,
      //         ),
      //         BottomNavigationBarItem(
      //           icon: ImageIcon(
      //             AssetImage(AppAssets.settings),
      //           ),
      //           label: '',
      //           backgroundColor: AppColors.primaryColor,
      //         ),
      //       ],
      //       // currentIndex: _selectedIndex,
      //       selectedFontSize: 0,
      //       unselectedFontSize: 0,
      //       selectedItemColor: AppColors.lightGold,
      //       currentIndex: _selectedIndex,
      //       onTap: _onItemTapped,
      //       // onTap: _onItemTapped,
      //     ),
      //   ),
      // ),
    );
  }
}
