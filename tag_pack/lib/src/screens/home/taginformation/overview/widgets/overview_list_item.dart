import 'package:flutter/material.dart';
import 'package:tag_pack/src/constants/AppColors.dart';
import 'package:tag_pack/src/model/TagInfoModel.dart';

class OverviewListItem extends StatelessWidget {
  OverviewListItem({Key? key, required this.composition}) : super(key: key);

  ItemCompositionModel composition;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 170),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
          color: AppColors.beige,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black, width: 1)),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: AppColors.colorDark),
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: AssetImage(composition.compositionIconPath),
                        fit: BoxFit.cover)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      composition.compositionType,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    Text(
                      '${composition.compositionPercent}% ${composition.compositionName}',
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              composition.compositionDescription,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
