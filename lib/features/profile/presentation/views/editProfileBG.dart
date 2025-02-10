import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_assets.dart';

class EditProfileBG extends StatelessWidget {
  const EditProfileBG({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: SvgPicture.asset(
            AppAssets.circleTopBG,
            width: 400,
            height: 300,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: SvgPicture.asset(
            AppAssets.circleBottomBG,
            width: 400,
            height: 300,
          ),
        ),
      ],
    );
  }
}
