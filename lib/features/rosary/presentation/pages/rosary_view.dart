import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:rockapp/app/styles/colors.dart';
import 'package:rockapp/app/styles/text_styles.dart';
import 'package:rockapp/app/styles/touchable_opacity.dart';
import 'package:rockapp/app/views/widgets/home_features.dart';
import 'package:rockapp/app/views/widgets/loader.dart';
import 'package:rockapp/app/views/widgets/search_bar.dart';
import 'package:rockapp/core/constant/constant.dart';
import 'package:rockapp/core/extensions/string_extensions.dart';
import 'package:rockapp/core/navigators/routes.dart';
import 'package:rockapp/features/church_prayers/presentation/pages/single_prayer.dart';
import 'package:rockapp/model/rosary.dart';
import 'package:rockapp/view_models/home/rosary_viewmodel.dart';
import 'package:stacked/stacked.dart';

class RosaryView extends StatefulWidget {
  const RosaryView({Key? key}) : super(key: key);

  @override
  _RosaryViewState createState() => _RosaryViewState();
}

class _RosaryViewState extends State<RosaryView> {
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
      body: ViewModelBuilder<RosaryViewModel>.reactive(
        viewModelBuilder: () => RosaryViewModel(),
        onModelReady: (model) => model.init(),
        builder: (context, model, child) {
          final _rosaryList = _searchText.isEmpty
              ? model.rosary
              : model.rosary == null
                  ? []
                  : model.rosary!
                      .where(
                        (item) =>
                            item.rosaryTitle.contains(
                              RegExp(StringUtil.escapeSpecial(_searchText),
                                  caseSensitive: false),
                            ) ||
                            item.rosaryTitle.contains(
                              RegExp(StringUtil.escapeSpecial(_searchText),
                                  caseSensitive: false),
                            ),
                      )
                      .toList();
          return (_rosaryList == null)
              ? const Center(
                  child: Loader(),
                )
              : SafeArea(
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
                                    'Holy Rosary',
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
                                _rosaryList.isNotEmpty
                                    ? ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: _rosaryList.length,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          final Rosary item =
                                              _rosaryList[index];
                                          return TouchableOpacity(
                                            onTap: () => Navigator.pushNamed(
                                              context,
                                              Routes.singleChurchPrayer,
                                              arguments: SinglePrayerArgs(
                                                title: item.rosaryTitle,
                                                message: item.rosaryMessage,
                                              ),
                                            ),
                                            child: ChurchPrayersHolder(
                                              title: item.rosaryTitle,
                                              icon: AppAssets.rosary,
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
