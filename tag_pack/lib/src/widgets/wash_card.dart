import 'package:flutter/material.dart';
import 'package:tag_pack/src/constants/AppColors.dart';
import 'package:tag_pack/src/model/WashItemModel.dart';
import 'package:tag_pack/src/widgets/icon_with_two_images.dart';

class WashCard extends StatelessWidget {
  WashCard({Key? key, required this.data, required this.actionOnItemClicked})
      : super(key: key);

  Function(WashItemModel itemModel) actionOnItemClicked;
  WashItemModel data;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.beige,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: AppColors.colorDark,
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
        onTap: () => actionOnItemClicked(data),
        title: Text(
          data.title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        leading: IconWithTwoImages(
            firstImagePath: data.stainIconPath,
            secondImagePath: data.fabricIconPath),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${data.stainName} + ${data.fabricName}',
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
            Text(
              'Difficulty of deduction: ${data.difficulty}',
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
