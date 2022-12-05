import 'package:flutter/material.dart';
import 'package:tag_pack/src/model/TagInfoModel.dart';

class CareListItem extends StatelessWidget {
  CareListItem({Key? key, required this.care}) : super(key: key);

  CareItem care;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 32,
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
                borderRadius: BorderRadius.circular(6),
                color: care.bgColor,
                image: DecorationImage(
                    image: AssetImage(care.iconPath), fit: BoxFit.scaleDown)),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              care.name,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          ))
        ],
      ),
    );
  }
}
