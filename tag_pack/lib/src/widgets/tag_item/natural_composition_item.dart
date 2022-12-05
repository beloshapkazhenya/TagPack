import 'package:flutter/material.dart';
import 'package:tag_pack/src/constants/AppColors.dart';

class NaturalCompositionItem extends StatelessWidget {
  NaturalCompositionItem({Key? key, this.composition}) : super(key: key);

  String? composition;

  @override
  Widget build(BuildContext context) {
    if (composition != null){
      return ClipRRect(
        borderRadius: BorderRadius.circular(7.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8 ),
          color: AppColors.colorGreen,
          child: Text(
            composition!,
            style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: AppColors.backgroundColor
            ),
          ),
        ),
      );
    }else{
      return Container();
    }
  }
}
