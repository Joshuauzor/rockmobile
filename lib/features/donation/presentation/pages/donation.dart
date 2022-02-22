import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:rockapp/app/styles/colors.dart';
import 'package:rockapp/app/styles/text_styles.dart';
import 'package:rockapp/app/styles/touchable_opacity.dart';
import 'package:rockapp/app/views/widgets/loader.dart';
import 'package:rockapp/app/views/widgets/search_bar.dart';
import 'package:rockapp/core/constant/constant.dart';
import 'package:rockapp/core/navigators/routes.dart';
import 'package:rockapp/model/donations.dart';
import 'package:rockapp/view_models/home/donation_viewmodel.dart';
import 'package:stacked/stacked.dart';

class DonationView extends StatefulWidget {
  const DonationView({Key? key}) : super(key: key);

  @override
  _DonationViewState createState() => _DonationViewState();
}

class _DonationViewState extends State<DonationView> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelBuilder<DonationViewModel>.reactive(
        viewModelBuilder: () => DonationViewModel(),
        onModelReady: (model) => model.init(),
        builder: (context, model, child) {
          return model.donationList == null
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
                          ],
                        ),
                        const Gap(6),
                        const Align(
                          alignment: Alignment.topCenter,
                          child: HeaderText(
                            'Donation',
                            color: AppColors.primaryColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Gap(10),
                                const Divider(),
                                const Gap(23),
                                const TitleText(
                                  'Will you like to donate to our cause?',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black,
                                ),
                                const Gap(5),
                                const TitleText(
                                  'Select from the list what you would like to donate for',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.lightestDark,
                                ),
                                const Gap(15),
                                model.donationList!.isNotEmpty
                                    ? ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: model.donationList!.length,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          final Donations item =
                                              model.donationList![index];
                                          return TouchableOpacity(
                                            onTap: () => Navigator.pushNamed(
                                              context,
                                              Routes.singleChurchPrayer,
                                            ),
                                            child: DonationBox(
                                              id: item.donationId,
                                              title: item.title,
                                              description: item.description,
                                              image: item.coverImage,
                                              uuid: item.uuid,
                                            ),
                                          );
                                        },
                                      )
                                    : const BodyText('No donation available'),
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

class DonationBox extends StatelessWidget {
  const DonationBox({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.uuid,
    Key? key,
  }) : super(key: key);

  final int id;
  final String title;
  final String description;
  final String image;
  final String uuid;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 21,
        left: 18,
        right: 14,
        bottom: 10,
      ),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            spreadRadius: 0,
            color: AppColors.homeMenuBox,
            offset: Offset(0, 8),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleText(
                  title,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: AppColors.lighterDark,
                ),
                const Gap(13),
                TitleText(
                  description,
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  color: AppColors.lighterDark,
                  maxLines: 6,
                ),
              ],
            ),
          ),
          const Gap(10),
          CachedNetworkImage(
            height: 123,
            width: 132,
            imageUrl: image,
            imageBuilder: (context, imageProvider) {
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
            placeholder: (context, url) => Image.asset(AppAssets.exodus),
            errorWidget: (context, url, error) => Image.asset(AppAssets.exodus),
          )
        ],
      ),
    );
  }
}
