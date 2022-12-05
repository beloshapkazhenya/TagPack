import 'package:flutter/material.dart';

class IconWithTwoImages extends StatelessWidget {
  IconWithTwoImages(
      {Key? key, required this.firstImagePath, required this.secondImagePath})
      : super(key: key);

  String firstImagePath;
  String secondImagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64,
      height: 64,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                  borderRadius: BorderRadius.circular(6),
                  image: DecorationImage(
                      image: AssetImage(secondImagePath), fit: BoxFit.cover)),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                  borderRadius: BorderRadius.circular(6),
                  image: DecorationImage(
                      image: AssetImage(firstImagePath), fit: BoxFit.cover)),
            ),
          ),
        ],
      ),
    );
  }
}
