import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:rockapp/app/styles/colors.dart';
import 'package:rockapp/app/styles/text_styles.dart';
import 'package:rockapp/app/views/widgets/video_media.dart';
import 'package:rockapp/app/views/widgets/widgets.dart';
import 'package:rockapp/core/extensions/string_extensions.dart';
import 'package:rockapp/view_models/home/media_viewmodel.dart';
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
        body: ViewModelBuilder<MediaViewModel>.reactive(
          viewModelBuilder: () => MediaViewModel(),
          onModelReady: (model) => model.init(),
          disposeViewModel: false,
          builder: (context, model, child) {
            final _mediaList = _searchText.isEmpty
                ? model.videoMedia
                : model.videoMedia == null
                    ? []
                    : model.videoMedia!
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
            return _mediaList == null
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
                              'Media',
                              color: AppColors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Gap(28),
                          SearchBar(searchController: _searchController),
                          const Gap(26),
                          _mediaList.isNotEmpty
                              ? Expanded(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        StaggeredGrid.count(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 26,
                                          mainAxisSpacing: 25,
                                          children: _mediaList
                                              .map(
                                                (e) => VideoMedia(
                                                  image: e.coverImage,
                                                  title: e.title,
                                                  author: e.author,
                                                ),
                                              )
                                              .toList(),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : const BodyText('No Media available'),
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
