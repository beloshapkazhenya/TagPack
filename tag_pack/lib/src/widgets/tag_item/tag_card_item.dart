import 'package:flutter/material.dart';
import 'package:tag_pack/src/constants/AppColors.dart';
import 'package:tag_pack/src/constants/assets.dart';
import 'package:tag_pack/src/model/TagItemModel.dart';
import 'package:tag_pack/src/widgets/tag_item/natural_composition_item.dart';
import 'package:tag_pack/src/widgets/tag_item/tag_icon.dart';

class TagCardItem extends StatelessWidget {
  TagCardItem({Key? key, required this.tagData, required this.itemTapAction})
      : super(key: key);

  TagItemModel tagData;
  Function() itemTapAction;

  Widget _createTagDescription() {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              tagData.tagName,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tagData.composition,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              NaturalCompositionItem(
                composition: tagData.naturalCompositionName,
              ),
            ],
          ),
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black),
          borderRadius: BorderRadius.circular(16),
          color: AppColors.beige),
      child: InkWell(
        onTap: () => itemTapAction(),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TagIcon(
                tagIconPath: tagData.iconPath,
              ),
              _createTagDescription(),
              Image(
                  image: AssetImage(tagData.isSaved
                      ? Assets.ic_saved_active
                      : Assets.ic_saved_inactive))
            ],
          ),
        ),
      ),
    );
  }
}
