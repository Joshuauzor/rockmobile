import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:rockapp/app/styles/colors.dart';
import 'package:rockapp/app/styles/text_styles.dart';
import 'package:rockapp/app/styles/touchable_opacity.dart';
import 'package:rockapp/app/views/widgets/tabs.dart';
import 'package:rockapp/core/constant/app_assets.dart';
import 'package:rockapp/core/constant/constant.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:rockapp/view_models/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedTabIndex = 0;

  void _onTabItemPressed(int index) {
    _tabController.animateTo(index);
  }

  @override
  void initState() {
    super.initState();
    // initialize _tabController
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedTabIndex = _tabController.index;
      });
    });
  }

  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: ViewModelBuilder<HomeViewModel>.reactive(
          viewModelBuilder: () => HomeViewModel(),
          onModelReady: (model) => model.init(),
          builder: (context, model, child) {
            return Column(
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
                              children: [
                                HeaderText(
                                  'Hello ${model.user!.firstName}',
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white,
                                ),
                                const Gap(3),
                                const HeaderText(
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
                Expanded(
                  child: Column(
                    children: [
                      const Gap(15),
                      CarouselSlider(
                        carouselController: _controller,
                        options: CarouselOptions(
                          height: 231,
                          initialPage: 0,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 4),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          },
                        ),
                        items: model.events!.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: i.media != null
                                      ? CachedNetworkImage(
                                          imageUrl: i.media!,
                                          imageBuilder:
                                              (context, imageProvider) {
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
                                          placeholder: (context, url) =>
                                              Image.asset(AppAssets.exodus),
                                          errorWidget: (context, url, error) =>
                                              Image.asset(AppAssets.exodus),
                                        )
                                      : Image.asset(AppAssets.exodus),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: model.events!.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => _controller.animateToPage(entry.key),
                            child: Container(
                              width: 7.0,
                              height: 7.0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 3.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? AppColors.white
                                        : AppColors.primaryColor)
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.4),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const Gap(10),
                      Container(
                        height: 32,
                        padding: const EdgeInsets.symmetric(horizontal: 21),
                        decoration: BoxDecoration(
                          color: AppColors.background,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: List<Widget>.generate(
                            3,
                            (int index) {
                              return _buildTabItem(
                                text: ['ROCK', 'ROCK News', 'Catholic'][index],
                                isActive: _selectedTabIndex == index,
                                onPressed: () => _onTabItemPressed(index),
                              );
                            },
                          ),
                        ),
                      ),
                      const Gap(27.24),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: const [
                            TabOne(),
                            TabTwo(),
                            TabThree(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

Widget _buildTabItem({
  required String text,
  required bool isActive,
  required VoidCallback onPressed,
}) {
  return Expanded(
    child: TouchableOpacity(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          height: 32,
          decoration: BoxDecoration(
            color: isActive ? AppColors.primaryColor : Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: const [
              BoxShadow(
                color: AppColors.homeMenuBox,
                offset: Offset(0, 8),
                blurRadius: 8,
              )
            ],
          ),
          child: Center(
            child: BodyText(
              text,
              color: isActive ? AppColors.white : AppColors.primaryColor,
            ),
          ),
        ),
      ),
    ),
  );
}
