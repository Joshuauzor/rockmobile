import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:rockapp/app/styles/colors.dart';
import 'package:rockapp/app/styles/text_styles.dart';
import 'package:rockapp/app/styles/touchable_opacity.dart';
import 'package:rockapp/app/views/widgets/home_features.dart';
import 'package:rockapp/app/views/widgets/search_bar.dart';
import 'package:rockapp/core/constant/constant.dart';
import 'package:rockapp/core/extensions/string_extensions.dart';
import 'package:rockapp/core/navigators/routes.dart';
import 'package:rockapp/features/church_prayers/presentation/pages/single_prayer.dart';
import 'package:rockapp/model/church_prayers.dart';
import 'package:rockapp/view_models/home/books_viewmodel.dart';
import 'package:rockapp/view_models/home/churchprayer_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ChurchPrayersView extends StatefulWidget {
  const ChurchPrayersView({Key? key}) : super(key: key);

  @override
  _ChurchPrayersViewState createState() => _ChurchPrayersViewState();
}

class _ChurchPrayersViewState extends State<ChurchPrayersView> {
  final _searchController = TextEditingController();
  String _searchText = '';

  @override
  void initState() {
    _searchText = _searchController.text.trim();
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text.trim();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelBuilder<ChurchPrayersViewModel>.reactive(
        viewModelBuilder: () => ChurchPrayersViewModel(),
        onModelReady: (model) => model.init(),
        builder: (context, model, child) {
          final _prayersList = _searchText.isEmpty
              ? model.churchPrayers
              : model.churchPrayers == null
                  ? []
                  : model.churchPrayers!
                      .where(
                        (item) =>
                            item.prayerTitle.contains(
                              RegExp(StringUtil.escapeSpecial(_searchText),
                                  caseSensitive: false),
                            ) ||
                            item.prayerTitle.contains(
                              RegExp(StringUtil.escapeSpecial(_searchText),
                                  caseSensitive: false),
                            ),
                      )
                      .toList();
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 29, right: 29),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TouchableOpacity(
                        onTap: () {
                          if (Navigator.canPop(context)) {
                            Navigator.pop(context);
                          }
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(AppAssets.arrowLeft),
                            const Gap(12),
                            const HeaderText(
                              'Back',
                              color: AppColors.lightBlack,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ],
                        ),
                      ),
                      Image.asset(AppAssets.generallogo),
                    ],
                  ),
                  const Gap(13),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.topLeft,
                            child: HeaderText(
                              'Church Prayers',
                              color: AppColors.primaryColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Gap(20),
                          SearchBar(searchController: _searchController),
                          const Gap(42),
                          const Divider(),
                          const Gap(31),
                          _prayersList!.isNotEmpty
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: _prayersList.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    final ChurchPrayers item =
                                        _prayersList[index];
                                    return TouchableOpacity(
                                      onTap: () => Navigator.pushNamed(
                                        context,
                                        Routes.singleChurchPrayer,
                                        arguments: SinglePrayerArgs(
                                          title: item.prayerTitle,
                                          message: item.prayerMessage,
                                        ),
                                      ),
                                      child: ChurchPrayersHolder(
                                        title: item.prayerTitle,
                                      ),
                                    );
                                  },
                                )
                              : const BodyText('No prayers available'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
