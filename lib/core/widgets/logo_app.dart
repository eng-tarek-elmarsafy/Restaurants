import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/style/app_style.dart';
import 'package:restaurants/core/style/assets.dart';

class LogoApp extends StatelessWidget {
  const LogoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('مطاعم', style: AppStyle.titleStyle),
        // const SizedBox(width: 30),
        SizedBox(
          width: 30,
          child: SvgPicture.asset(
            Assets.imagesImagesLogo,
            colorFilter: const ColorFilter.mode(kNeutralColor, BlendMode.srcIn),
          ),
        ),
      ],
    );
  }
}
