import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:rockapp/app/styles/touchable_opacity.dart';
import 'package:rockapp/app/views/widgets/home_features.dart';
import 'package:rockapp/core/constant/constant.dart';
import 'package:rockapp/core/navigators/navigators.dart';
import 'package:rockapp/features/home/home.dart';

class TabOne extends StatelessWidget {
  const TabOne({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 33.88),
        child: StaggeredGrid.count(
          crossAxisCount: 2,
          crossAxisSpacing: 23.56,
          mainAxisSpacing: 23.56,
          children: [
            TouchableOpacity(
              onTap: () =>
                  Navigator.pushNamed(context, Routes.selectReadingView),
              child: const HomeFeatures(
                icon: AppAssets.reading,
                title: 'Daily Readings',
              ),
            ),
            TouchableOpacity(
              onTap: () => Navigator.pushNamed(context, Routes.churchPrayers),
              child: const HomeFeatures(
                icon: AppAssets.prayers,
                title: 'Church Prayers',
              ),
            ),
            TouchableOpacity(
              onTap: () => Navigator.pushNamed(context, Routes.rosaryView),
              child: const HomeFeatures(
                icon: AppAssets.rosary,
                title: 'Holy Rosary',
              ),
            ),
            TouchableOpacity(
              onTap: () => Navigator.pushNamed(context, Routes.mediaView),
              child: const HomeFeatures(
                icon: AppAssets.sermons,
                title: 'Media Reflection',
              ),
            ),
            TouchableOpacity(
              onTap: () =>
                  Navigator.pushNamed(context, Routes.prayerRequestView),
              child: const HomeFeatures(
                icon: AppAssets.prayer,
                title: 'Prayer Request',
              ),
            ),
            TouchableOpacity(
              onTap: () => Navigator.pushNamed(context, Routes.donations),
              child: const HomeFeatures(
                icon: AppAssets.donation,
                title: 'Donations',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TabTwo extends StatelessWidget {
  const TabTwo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? webBaseUrl = dotenv.env[WEB_BASE_URL];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 33.88),
        child: StaggeredGrid.count(
          crossAxisCount: 2,
          crossAxisSpacing: 23.56,
          mainAxisSpacing: 23.56,
          children: [
            TouchableOpacity(
              onTap: () => Navigator.pushNamed(context, Routes.rockWebView,
                  arguments: RockWebViewArgs(
                      uuid: 'uuid',
                      title: 'About Us',
                      url: '$webBaseUrl/about')),
              child: const HomeFeatures(
                icon: AppAssets.about,
                title: 'About ROCK',
              ),
            ),
            TouchableOpacity(
              onTap: () => Navigator.pushNamed(
                context,
                Routes.rules,
              ),
              child: const HomeFeatures(
                icon: AppAssets.rules,
                title: 'Rules & Regulations',
              ),
            ),
            TouchableOpacity(
              onTap: () => Navigator.pushNamed(
                context,
                Routes.membership,
              ),
              child: const HomeFeatures(
                icon: AppAssets.members,
                title: 'Membership',
              ),
            ),
            const HomeFeatures(
              icon: AppAssets.news,
              title: 'ROCK News',
            ),
          ],
        ),
      ),
    );
  }
}

class TabThree extends StatelessWidget {
  const TabThree({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 33.88),
        child: StaggeredGrid.count(
          crossAxisCount: 2,
          crossAxisSpacing: 23.56,
          mainAxisSpacing: 23.56,
          children: const [
            HomeFeatures(
              icon: AppAssets.nigeria,
              title: 'Nigeria News',
            ),
            HomeFeatures(
              icon: AppAssets.worldwide,
              title: 'Worldwide News',
            ),
          ],
        ),
      ),
    );
  }
}
