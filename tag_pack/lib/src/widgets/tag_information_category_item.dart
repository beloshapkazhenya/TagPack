import 'package:flutter/material.dart';
import 'package:tag_pack/src/constants/AppColors.dart';

class TagInformationCategoryItem extends StatefulWidget {
  TagInformationCategoryItem(
      {Key? key,
      required this.isSelected,
      required this.title})
      : super(key: key);

  bool isSelected;
  String title;

  @override
  State<TagInformationCategoryItem> createState() =>
      _TagInformationCategoryItemState();
}

class _TagInformationCategoryItemState
    extends State<TagInformationCategoryItem> {
  @override
  Widget build(BuildContext context) {
    if (widget.isSelected) {
      return Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6), topRight: Radius.circular(6)),
            image: DecorationImage(image: AssetImage('assets/bg_category.png'), fit: BoxFit.fill),
            color: AppColors.beige),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 12),
          child: Center(
            child: Text(
              widget.title,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          ),
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(6), topRight: Radius.circular(6)),
            border: Border.all(
                color: AppColors.colorDark,
                width: 1,
                strokeAlign: StrokeAlign.center),
            color: AppColors.backgroundColor),
        child: Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 12),
          child: Center(
            child: Text(
              widget.title,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          ),
        ),
      );
    }
  }
}
