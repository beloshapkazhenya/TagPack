import 'package:flutter/material.dart';
import 'package:tag_pack/src/constants/AppColors.dart';

class SettingsMenuItem extends StatelessWidget {
  SettingsMenuItem({Key? key, required this.title, required this.itemAction})
      : super(key: key);

  String title;
  Function() itemAction;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 32,
      height: 46,
      child: ElevatedButton(
          onPressed: () => itemAction,
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(AppColors.beige),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: const BorderSide(
                          color: AppColors.colorDark, width: 1)))),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          )),
    );
  }
}
