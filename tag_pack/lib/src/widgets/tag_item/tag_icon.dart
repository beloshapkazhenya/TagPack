import 'package:flutter/material.dart';
import 'package:tag_pack/src/constants/assets.dart';

class TagIcon extends StatelessWidget {
  TagIcon({Key? key, this.tagIconPath}) : super(key: key);

  String? tagIconPath;

  @override
  Widget build(BuildContext context) {
    if (tagIconPath != null) {
      return Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
                image: NetworkImage(tagIconPath!), fit: BoxFit.cover)),
      );
    } else {
      return Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
            borderRadius: BorderRadius.circular(12),
            image: const DecorationImage(
              image: AssetImage(Assets.default_photo),
            )),
      );
    }
  }
}
