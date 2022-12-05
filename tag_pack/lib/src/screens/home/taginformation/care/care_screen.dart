import 'package:flutter/material.dart';
import 'package:tag_pack/src/constants/AppColors.dart';
import 'package:tag_pack/src/constants/assets.dart';
import 'package:tag_pack/src/model/TagInfoModel.dart';
import 'package:tag_pack/src/screens/home/taginformation/care/widgets/care_list_item.dart';
import 'package:tag_pack/src/utils/utils.dart';

class CarePart extends StatefulWidget {
  CarePart({Key? key, required this.care, required this.difficulty})
      : super(key: key);

  String difficulty;
  List<CareItem> care;

  @override
  State<CarePart> createState() => _CarePartState();
}

class _CarePartState extends State<CarePart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(6), bottomRight: Radius.circular(6)),
          color: AppColors.beige,
          image: DecorationImage(
              image: AssetImage(Assets.bg_category_overview),
              fit: BoxFit.fill)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
        child: ScrollConfiguration(
            behavior: ScrollBehaviorWithoutGlow(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      'Difficulty of care: ${widget.difficulty}',
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ),
                  ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CareListItem(care: widget.care[index]);
                      },
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Container(
                              height: 1,
                              color: AppColors.colorDark,
                            ),
                          ),
                      itemCount: widget.care.length)
                ],
              ),
            )),
      ),
    );
  }
}
