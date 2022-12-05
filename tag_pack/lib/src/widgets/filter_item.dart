import 'package:flutter/material.dart';
import 'package:tag_pack/src/constants/AppColors.dart';

class FilterItem extends StatelessWidget {
  FilterItem(
      {Key? key,
      required this.actionOnItemClicked,
      required this.filterName,
      required this.filterType})
      : super(key: key);

  Function() actionOnItemClicked;
  String filterType;
  String filterName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.beige,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1, color: AppColors.colorDark)),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 34,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$filterType: ',
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
          Text(
            filterName,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black),
          ),
          IconButton(
              onPressed: () => actionOnItemClicked(),
              padding: const EdgeInsets.only(left: 16),
              icon: const Icon(
                Icons.close,
                color: AppColors.colorDark,
                size: 20,
              ))
        ],
      ),
    );
  }
}
