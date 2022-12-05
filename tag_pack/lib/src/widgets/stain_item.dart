import 'package:flutter/material.dart';
import 'package:tag_pack/src/constants/AppColors.dart';
import 'package:tag_pack/src/model/Enums.dart';
import 'package:tag_pack/src/utils/utils.dart';

class ChoseStainItem extends StatelessWidget {
  ChoseStainItem(
      {Key? key, required this.type, required this.isSelected})
      : super(key: key);

  StainType type;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: isSelected ? AppColors.beige : AppColors.backgroundColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: isSelected ? AppColors.colorDark : AppColors.backgroundColor,
        ),
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Column(
          children: [
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                  borderRadius: BorderRadius.circular(6),
                  image: DecorationImage(
                      image: AssetImage(getStainImagePathByType(type)),
                      fit: BoxFit.cover)),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 8)),
            Text(
              getStainTitleByType(type),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
