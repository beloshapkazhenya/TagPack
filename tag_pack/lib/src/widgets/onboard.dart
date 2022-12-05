import 'package:flutter/material.dart';
import 'package:tag_pack/src/constants/AppColors.dart';
import 'package:tag_pack/src/widgets/onboard_btns.dart';

class Onboard extends StatelessWidget {
  Onboard(this.backgroundImagePath, this.titleText, this.descriptionText,
      this.nextBtnCallback, this.skipBtnCallback,
      {super.key});

  String backgroundImagePath;
  String titleText;
  String descriptionText;
  Function() nextBtnCallback;
  Function()? skipBtnCallback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(backgroundImagePath),
                    fit: BoxFit.fitWidth),
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
                    Flexible(
                      child: Text(
                        titleText,
                        softWrap: true,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 16.0)),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 32,
                      child: Text(
                        descriptionText,
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        maxLines: 4,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 50.0)),
                    OnboardBtns(nextBtnCallback, skipBtnCallback),
                    const Padding(padding: EdgeInsets.only(bottom: 32.0)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
