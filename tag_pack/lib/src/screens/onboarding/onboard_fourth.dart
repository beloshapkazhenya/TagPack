import 'package:flutter/material.dart';
import 'package:tag_pack/src/constants/assets.dart';
import 'package:tag_pack/src/constants/strings.dart';
import 'package:tag_pack/src/screens/login/login.dart';
import 'package:tag_pack/src/utils/utils.dart';
import 'package:tag_pack/src/widgets/onboard.dart';

class OnboardFourth extends StatelessWidget {
  const OnboardFourth({Key? key}) : super(key: key);

  void goToNextScreen(BuildContext context) {
    Navigator.of(context)
        .pushReplacement(getPageRouterWithVerticalTransition(const Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Onboard(
        Assets.onboard_4,
        Strings.onboard_fourth_title,
        Strings.onboard_fourth_description,
        () => goToNextScreen(context),
        null);
  }
}
