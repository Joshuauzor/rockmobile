import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:rockapp/app/views/widgets/home_features.dart';
import 'package:rockapp/core/constant/constant.dart';

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
          children: const [
            HomeFeatures(
              icon: AppAssets.reading,
              title: 'Daily Readings',
            ),
            HomeFeatures(
              icon: AppAssets.prayers,
              title: 'Church Prayers',
            ),
            HomeFeatures(
              icon: AppAssets.rosary,
              title: 'Holy Rosary',
            ),
            HomeFeatures(
              icon: AppAssets.sermons,
              title: 'Sermons',
            ),
            HomeFeatures(
              icon: AppAssets.prayer,
              title: 'Prayer Request',
            ),
            HomeFeatures(
              icon: AppAssets.donation,
              title: 'Donations',
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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 33.88),
        child: StaggeredGrid.count(
          crossAxisCount: 2,
          crossAxisSpacing: 23.56,
          mainAxisSpacing: 23.56,
          children: const [
            HomeFeatures(
              icon: AppAssets.about,
              title: 'About ROCK',
            ),
            HomeFeatures(
              icon: AppAssets.rules,
              title: 'Rules & Regulations',
            ),
            HomeFeatures(
              icon: AppAssets.members,
              title: 'Membership',
            ),
            HomeFeatures(
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
              title: 'Catholic News Nigeria',
            ),
            HomeFeatures(
              icon: AppAssets.worldwide,
              title: 'Catholic News Worldwide',
            ),
          ],
        ),
      ),
    );
  }
}
