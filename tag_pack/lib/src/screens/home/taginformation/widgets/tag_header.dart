import 'package:flutter/material.dart';
import 'package:tag_pack/src/constants/AppColors.dart';

class TagHeader extends StatelessWidget {
  TagHeader({Key? key, required this.name, required this.iconPath})
      : super(key: key);

  String name;
  String iconPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 26),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColors.colorDark),
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                    image: AssetImage(iconPath), fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              name,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
