import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutri_call_app/routers/router_name.dart';
import 'package:nutri_call_app/utils/app_color.dart';
import 'package:nutri_call_app/utils/assets.gen.dart';

class Splashscreen extends StatefulHookConsumerWidget {
  const Splashscreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashscreenState();
}

class _SplashscreenState extends ConsumerState<Splashscreen> {
  double _scale = 0.2; 

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _scale = 1.0; 
      });
    });

    Future.delayed(const Duration(seconds: 3), () {
      context.push(RouteName.main);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.disabledGreen,
      body: Center(
        child: AnimatedScale(
          scale: _scale,
          duration: const Duration(seconds: 1),
          curve: Curves.easeOutBack, 
          child: Hero(
            tag: 'logo',
            child: Image.asset(
              Assets.images.logoApp.path,
              height: 180,
            ),
          ),
        ),
      ),
    );
  }
}

