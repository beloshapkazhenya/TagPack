import 'package:flutter/material.dart';
import 'package:tag_pack/src/constants/AppColors.dart';

class ScanStageItem extends StatelessWidget {
  ScanStageItem({Key? key, required this.stageName, required this.isChecked})
      : super(key: key);

  bool isChecked;
  String stageName;

  @override
  Widget build(BuildContext context) {
    if (isChecked) {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.backgroundColor),
          borderRadius: BorderRadius.circular(12.0),
          color: AppColors.scanStageActive,
        ),
        child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                const Icon(
                  Icons.check_circle_outline,
                  color: AppColors.beige,
                ),
                const Padding(padding: EdgeInsets.only(right: 8)),
                Text(
                  stageName,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.beige,
                  ),
                ),
              ],
            )),
      );
    } else {
      return Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: AppColors.backgroundColor),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Text(
              stageName,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.beige,
              ),
            ),
          ));
    }
  }
}
