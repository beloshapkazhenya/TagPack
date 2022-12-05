import 'package:flutter/material.dart';
import 'package:tag_pack/src/constants/assets.dart';
import 'package:tag_pack/src/constants/strings.dart';
import 'package:tag_pack/src/screens/login/login.dart';
import 'package:tag_pack/src/screens/onboarding/onboard_fourth.dart';
import 'package:tag_pack/src/utils/utils.dart';
import 'package:tag_pack/src/widgets/onboard.dart';

class OnboardThird extends StatelessWidget {
  const OnboardThird({Key? key}) : super(key: key);

  void goToNextScreen(BuildContext context) {
    Navigator.of(context).pushReplacement(
        getPageRouterWithHorizontalTransition(const OnboardFourth()));
  }

  void skipOnboard(BuildContext context) {
    Navigator.of(context)
        .pushReplacement(getPageRouterWithVerticalTransition(const Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Onboard(
        Assets.onboard_3,
        Strings.onboard_third_title,
        Strings.onboard_third_description,
        () => goToNextScreen(context),
        () => skipOnboard(context));
  }
}
