import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:rockapp/app/styles/colors.dart';
import 'package:rockapp/app/styles/text_styles.dart';
import 'package:rockapp/app/views/widgets/video_media.dart';
import 'package:rockapp/app/views/widgets/widgets.dart';
import 'package:rockapp/core/extensions/string_extensions.dart';
import 'package:rockapp/view_models/home/music_viewmodel.dart';
import 'package:stacked/stacked.dart';

class MediaLibrary extends StatefulWidget {
  const MediaLibrary({Key? key}) : super(key: key);

  @override
  _MediaLibraryState createState() => _MediaLibraryState();
}

class _MediaLibraryState extends State<MediaLibrary> {
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
                              'Sermons',
                              color: AppColors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Gap(28),
                          SearchBar(searchController: _searchController),
                          const Gap(26),
                          _musicList.isNotEmpty
                              ? StaggeredGrid.count(
                                  crossAxisCount: 2,
                                  children: model.audioMusic!
                                      .map(
                                        (e) => Row(
                                          children: [
                                            VideoMedia(
                                              image:
                                                  'https://rockapostolate.org/public/users/previewImage/1640170305_8b48f35daecadb708317.jpg',
                                              title: e.title,
                                              author: 'Richmond Diala',
                                            )
                                          ],
                                        ),
                                      )
                                      .toList(),
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
