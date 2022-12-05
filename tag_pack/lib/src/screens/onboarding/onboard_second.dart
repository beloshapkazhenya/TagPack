import 'package:flutter/material.dart';
import 'package:tag_pack/src/constants/assets.dart';
import 'package:tag_pack/src/constants/strings.dart';
import 'package:tag_pack/src/screens/login/login.dart';
import 'package:tag_pack/src/screens/onboarding/onboard_third.dart';
import 'package:tag_pack/src/utils/utils.dart';
import 'package:tag_pack/src/widgets/onboard.dart';

class OnboardSecond extends StatelessWidget {
  const OnboardSecond({Key? key}) : super(key: key);

  void goToNextScreen(BuildContext context) {
    Navigator.of(context)
        .pushReplacement(getPageRouterWithHorizontalTransition(const OnboardThird()));
  }

  void skipOnboard(BuildContext context) {
    Navigator.of(context)
        .pushReplacement(getPageRouterWithVerticalTransition(const Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Onboard(
        Assets.onboard_2,
        Strings.onboard_second_title,
        Strings.onboard_second_description,
        () => goToNextScreen(context),
        () => skipOnboard(context));
  }
}
