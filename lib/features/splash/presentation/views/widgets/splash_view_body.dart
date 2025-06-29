import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/style/app_style.dart';
import 'package:restaurants/core/style/assets.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  double _scale = 2.0; 

  @override
  void initState() {
    super.initState();
    
    Future.delayed(Duration(milliseconds: 400), () {
      setState(() {
        _scale = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 2.0, end: _scale),
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeOut,
        builder: (context, value, child) {
          return Transform.scale(
            scale: value,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('مطاعم', style: AppStyle.titleStyle),
                // const SizedBox(width: 30),
                SizedBox(
                  width: 30,
                  child: SvgPicture.asset(
                    Assets.imagesImagesLogo,
                    colorFilter: const ColorFilter.mode(
                      kNeutralColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
