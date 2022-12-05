import 'package:flutter/material.dart';
import 'package:tag_pack/src/constants/AppColors.dart';
import 'package:tag_pack/src/constants/assets.dart';
import 'package:tag_pack/src/constants/strings.dart';
import 'package:tag_pack/src/model/Enums.dart';
import 'package:tag_pack/src/screens/main_screen/main_screen.dart';
import 'package:tag_pack/src/utils/utils.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  void goToHomeScreen(BuildContext context) {
    Navigator.of(context).pushReplacement(
        getPageRouterWithVerticalTransition(const MainScreen()));
  }

  void login(LoginType type, BuildContext context) {
    switch (type) {
      case LoginType.google:
        //do google auth
        goToHomeScreen(context);
        break;
      case LoginType.facebook:
        //do facebook auth
        goToHomeScreen(context);
        break;
      case LoginType.twitter:
        //do twitter auth
        goToHomeScreen(context);
        break;
    }
  }

  Widget _createBtn(
      BuildContext context, String text, String iconPath, LoginType loginType) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 32,
      height: 46,
      child: ElevatedButton.icon(
        onPressed: () {
          login(loginType, context);
        },
        icon: Image.asset(iconPath),
        label: Text(
          text,
          style: const TextStyle(
            color: AppColors.backgroundColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(AppColors.colorDark),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: AppColors.backgroundColor,
      child: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Assets.login_bg), fit: BoxFit.fitWidth),
                  color: AppColors.backgroundColor),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Image(image: AssetImage(Assets.logo_big)),
                      const Padding(padding: EdgeInsets.only(bottom: 220.0)),
                      const Text(
                        Strings.login_title,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 30.0)),
                      _createBtn(context, Strings.continue_with_google,
                          Assets.icon_google, LoginType.google),
                      const Padding(padding: EdgeInsets.only(bottom: 16)),
                      _createBtn(context, Strings.continue_with_facebook,
                          Assets.icon_facebook, LoginType.facebook),
                      const Padding(padding: EdgeInsets.only(bottom: 16)),
                      _createBtn(context, Strings.continue_with_twitter,
                          Assets.icon_twitter, LoginType.twitter),
                      const Padding(padding: EdgeInsets.only(bottom: 32))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
