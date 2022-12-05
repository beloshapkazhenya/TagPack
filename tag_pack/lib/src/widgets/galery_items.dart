import 'package:flutter/material.dart';
import 'package:tag_pack/src/constants/AppColors.dart';

class GalleryItems extends StatelessWidget {
  GalleryItems({Key? key, required this.items}) : super(key: key);

  List<String> items;

  Widget _imageWithBorder(String imagePath, {int countPhotos = 0}) {
    return Container(
      width: 100,
      height: 80,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.colorDark),
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
              image: AssetImage(imagePath), fit: BoxFit.contain)),
      child: countPhotos > 0
          ? Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.black40),
              child: Center(
                child: Text(
                  '+ $countPhotos photo',
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.beige),
                ),
              ),
            )
          : Container(),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (items.length) {
      case 1:
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _imageWithBorder(items[0]),
            ],
          ),
        );
      case 2:
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_imageWithBorder(items[0]), _imageWithBorder(items[1])],
          ),
        );
      case 3:
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _imageWithBorder(items[0]),
              _imageWithBorder(items[1]),
              _imageWithBorder(items[2])
            ],
          ),
        );
      default:
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _imageWithBorder(items[0]),
              _imageWithBorder(items[1]),
              _imageWithBorder(items[2], countPhotos: items.length - 3)
            ],
          ),
        );
    }
  }
}
