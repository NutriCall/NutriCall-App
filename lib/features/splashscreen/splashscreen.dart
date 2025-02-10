import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutri_call_app/extensions/build_context.ext.dart';
import 'package:nutri_call_app/routers/router_name.dart';
import 'package:nutri_call_app/utils/assets.gen.dart';

class Splashscreen extends StatefulHookConsumerWidget {
  const Splashscreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashscreenState();
}

class _SplashscreenState extends ConsumerState<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      context.push(RouteName.main);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1323),
      body: Column(
        children: [
          const Spacer(),
          Stack(
            children: [
              Image.asset(
                Assets.images.mountainElement.path,
                fit: BoxFit.cover,
                height: context.deviceHeight * 0.6,
                width: context.deviceWidth,
              ),
              Center(
                child: Hero(
                  tag: 'logo',
                  child: Image.asset(
                    Assets.images.logoApp.path,
                    height: 94,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
