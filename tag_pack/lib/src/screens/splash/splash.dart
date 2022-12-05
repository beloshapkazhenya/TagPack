import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tag_pack/src/constants/AppColors.dart';
import 'package:tag_pack/src/constants/assets.dart';
import 'package:tag_pack/src/model/TagItemModel.dart';
import 'package:tag_pack/src/screens/onboarding/onboard_first.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initHive();
    startTimer();
  }

  initHive() async {
    Hive.initFlutter();
    Hive.registerAdapter(TagItemModelAdapter());
  }

  void startTimer() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const OnboardFirst()));
      timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return Scaffold(
        body: ConstrainedBox(
          constraints: BoxConstraints(minHeight: viewportConstraints.maxHeight),
          child: Container(
            color: AppColors.backgroundColor,
            child: const Center(
              child: Image(image: AssetImage(Assets.logo_big)),
            ),
          ),
        ),
      );
    });
  }
}
