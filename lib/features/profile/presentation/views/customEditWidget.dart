import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_assets.dart';

class CustomEditWidget extends StatefulWidget {
  const CustomEditWidget({super.key});

  @override
  State<CustomEditWidget> createState() => _CustomEditWidgetState();
}

class _CustomEditWidgetState extends State<CustomEditWidget> {
  @override
  Widget build(BuildContext context) {
    double profileSize = 35;
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipOval(
          child: SizedBox(
            width: profileSize * 1.1,
            height: profileSize * 1.1,
            child: SvgPicture.asset(
              AppAssets.editBorder,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        ClipOval(
          child: Container(
            width: 30,
            height: 30,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: SvgPicture.asset(
                AppAssets.editIcon,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
