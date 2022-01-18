import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:rockapp/app/styles/colors.dart';
import 'package:rockapp/app/styles/text_styles.dart';
import 'package:rockapp/app/styles/touchable_opacity.dart';
import 'package:rockapp/core/constant/constant.dart';

class Terms extends StatefulWidget {
  const Terms({Key? key}) : super(key: key);

  @override
  _TermsState createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TouchableOpacity(
                      onTap: () {
                        if (Navigator.canPop(context)) Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(AppAssets.arrowLeft),
                          const Gap(12),
                          const HeaderText(
                            'Back',
                            color: AppColors.lightBlack,
                            fontSize: 17,
                          ),
                        ],
                      ),
                    ),
                    Image.asset(AppAssets.generallogo),
                  ],
                ),
              ),
              const Gap(44),
              const HeaderText(
                'Terms and conditions',
                color: AppColors.primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              const Gap(11),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 21),
                child: Divider(),
              ),
              const Gap(19),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 31),
                child: LongText(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pulvinar volutpat ultrices imperdiet tincidunt mi sed consequat. Enim sapien adipiscing at sagittis, pellentesque phasellus libero sem ultrices. Libero, diam a arcu purus ut massa mi in. Risus morbi commodo eu, sollicitudin. Sed at rhoncus vitae, eget. Etiam lacus erat scelerisque ut orci, ullamcorper interdum. Placerat consequat aenean volutpat et. Amet mi donec dignissim feugiat. Eu, quis id orci commodo. Non at vestibulum pharetra quis. Commodo pellentesque justo aliquet tortor in lectus leo pellentesque. Commodo risus viverra suscipit et, sit convallis. Non mauris enim amet sit aliquam, urna. Ut morbi tortor eu consequat non, condimentum. Dapibus volutpat aliquam tortor mollis. Interdum et aenean blandit a ac montes, ornare amet aliquet. Et lectus sed magna praesent. Faucibus malesuada sit mollis dignissim. Nisi, est sit leo in elit, urna. In massa in risus accumsan enim bibendum in neque, cursus. Et euismod purus neque ac egestas. Sed volutpat dui orci facilisi venenatis, phasellus ut purus quam. Morbi morbi neque, dapibus in lacus vitae. Mi sed blandit in neque dui. Nunc cras dui id nunc.',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
