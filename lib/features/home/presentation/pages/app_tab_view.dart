import 'package:flutter/material.dart';
import 'package:rockapp/app/styles/colors.dart';
import 'package:rockapp/app/views/widgets/bottom_navbar.dart';
import 'package:rockapp/core/constant/constant.dart';
import 'package:rockapp/features/books/books.dart';
import 'package:rockapp/features/home/home.dart';
import 'package:rockapp/features/settings/presentation/pages/settings.dart';

class AppTabView extends StatefulWidget {
  const AppTabView({Key? key}) : super(key: key);

  @override
  _AppTabViewState createState() => _AppTabViewState();
}

class _AppTabViewState extends State<AppTabView> {
  int? _selectedIndex;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    setState(() {
      _selectedIndex = 2;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _widgetOptions = <Widget?>[
      Container(),
      const BookStore(),
      const HomeView(),
      Container(),
      const Settings(),
    ];
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Expanded(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              child: _widgetOptions.elementAt(_selectedIndex!),
            ),
          ),
        ],
      ),
      bottomNavigationBar: FABBottomAppBar(
        backgroundColor: AppColors.white,
        selectedColor: AppColors.lightGold,
        height: 50,
        notchedShape: const CircularNotchedRectangle(),
        onTabSelected: _onItemTapped,
        currentIndex: _selectedIndex,
        items: [
          FABBottomAppBarItem(
            icon: AppAssets.audio,
          ),
          FABBottomAppBarItem(
            icon: AppAssets.bible,
          ),
          FABBottomAppBarItem(
            icon: AppAssets.home,
          ),
          FABBottomAppBarItem(
            icon: AppAssets.music,
          ),
          FABBottomAppBarItem(
            icon: AppAssets.settings,
          ),
        ],
      ),
    );
  }
}

class AppTabViewParams {
  final int? index;
  final Widget? child;
  AppTabViewParams({this.child, this.index});
}
