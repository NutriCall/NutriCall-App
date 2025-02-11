import 'package:flutter/material.dart';
import 'package:nutri_call_app/utils/assets.gen.dart';

class AppLogo extends StatelessWidget {
  final double height;

  const AppLogo({Key? key, this.height = 100}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.images.logoApp.path,
      height: height,
    );
  }
}
