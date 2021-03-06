import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:rockapp/app/styles/colors.dart';
import 'package:rockapp/app/styles/text_styles.dart';
import 'package:rockapp/app/styles/touchable_opacity.dart';
import 'package:rockapp/app/views/widgets/widgets.dart';
import 'package:rockapp/core/extensions/string_extensions.dart';
import 'package:rockapp/core/navigators/routes.dart';
import 'package:rockapp/features/music/music.dart';
import 'package:rockapp/model/music.dart';
import 'package:rockapp/view_models/home/music_viewmodel.dart';
import 'package:stacked/stacked.dart';

class MusicLibrary extends StatefulWidget {
  const MusicLibrary({Key? key}) : super(key: key);

  @override
  _MusicLibraryState createState() => _MusicLibraryState();
}

class _MusicLibraryState extends State<MusicLibrary> {
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
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: ViewModelBuilder<MusicViewModel>.reactive(
          viewModelBuilder: () => MusicViewModel(),
          onModelReady: (model) => model.init(),
          disposeViewModel: false,
          builder: (context, model, child) {
            final _musicList = _searchText.isEmpty
                ? model.audioMusic
                : model.audioMusic == null
                    ? []
                    : model.audioMusic!
                        .where(
                          (item) =>
                              item.title.contains(
                                RegExp(StringUtil.escapeSpecial(_searchText),
                                    caseSensitive: false),
                              ) ||
                              item.author.contains(
                                RegExp(StringUtil.escapeSpecial(_searchText),
                                    caseSensitive: false),
                              ),
                        )
                        .toList();
            return _musicList == null
                ? const Center(
                    child: Loader(),
                  )
                : SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 32, right: 29),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Align(
                            alignment: Alignment.center,
                            child: BodyText(
                              'Audio',
                              color: AppColors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Gap(28),
                          SearchBar(searchController: _searchController),
                          const Gap(26),
                          _musicList.isNotEmpty
                              ? Expanded(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: _musicList.length,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      final Music item = _musicList[index];
                                      return TouchableOpacity(
                                        onTap: () => Navigator.pushNamed(
                                          context,
                                          Routes.musicPlayerView,
                                          arguments: MusicPlayerViewsArgs(
                                            uuid: item.uuid,
                                            coverImage: item.coverImage,
                                            title: item.title,
                                            media: item.media,
                                            author: item.author,
                                          ),
                                        ),
                                        child: MusicTile(
                                          title: item.title,
                                          coverImage: item.coverImage,
                                          media: item.media,
                                          busy: model.busy,
                                        ),
                                      );
                                    },
                                  ),
                                )
                              : const BodyText('No Music available'),
                        ],
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
