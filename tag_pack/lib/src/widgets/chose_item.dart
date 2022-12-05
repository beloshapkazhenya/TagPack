import 'package:flutter/material.dart';
import 'package:tag_pack/src/constants/AppColors.dart';

class ChoseItem extends StatelessWidget {
  ChoseItem(
      {Key? key,
      required this.choseTitle,
      required this.chosenItemImagePath,
      required this.onItemClicked})
      : super(key: key);

  String choseTitle;
  String chosenItemImagePath;
  Function() onItemClicked;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onItemClicked(),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.beige,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 1, color: AppColors.colorDark)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: AppColors.colorDark),
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: AssetImage(chosenItemImagePath),
                        fit: BoxFit.fill)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  choseTitle,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
