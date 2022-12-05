import 'package:flutter/material.dart';
import 'package:tag_pack/src/constants/AppColors.dart';
import 'package:tag_pack/src/constants/strings.dart';

class OnboardBtns extends StatelessWidget {
  OnboardBtns(this.nextBtnAction, this.skipBtnAction, {super.key});

  Function()? skipBtnAction;
  Function() nextBtnAction;

  @override
  Widget build(BuildContext context) {
    if (skipBtnAction != null) {
      return SizedBox(
          width: MediaQuery.of(context).size.width - 32,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: skipBtnAction,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 28),
                    child: Text(
                      Strings.skip,
                      style: TextStyle(
                          color: AppColors.colorDark,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  )),
              ElevatedButton(
                onPressed: nextBtnAction,
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColors.colorDark),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)))),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                  child: Text(
                    Strings.next,
                    style: TextStyle(
                        color: AppColors.backgroundColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              )
            ],
          ));
    } else {
      return SizedBox(
        width: MediaQuery.of(context).size.width - 32,
        height: 46,
        child: ElevatedButton(
          onPressed: nextBtnAction,
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(AppColors.colorDark),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)))),
          child: const Text(
            Strings.get_started,
            style: TextStyle(
              color: AppColors.backgroundColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      );
    }
  }
}
