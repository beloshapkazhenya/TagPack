import 'package:flutter/material.dart';
import 'package:tag_pack/src/constants/AppColors.dart';
import 'package:tag_pack/src/model/CareModel.dart';

class CareItem extends StatelessWidget {
  CareItem({Key? key, required this.data, required this.deleteBtnAction})
      : super(key: key);

  CareModel data;
  Function(CareModel itemData) deleteBtnAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black),
        borderRadius: BorderRadius.circular(6.0),
        color: data.bgColor,
      ),
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.all(6),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image(
            image: AssetImage(data.imagePath),
          ),
          IconButton(
            alignment: Alignment.topRight,
            padding: EdgeInsets.zero,
            onPressed: () => deleteBtnAction(data),
            icon: const Icon(Icons.close),
            color: AppColors.colorDark,
          ),
        ],
      ),
    );
  }
}
