import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:tag_pack/src/constants/AppColors.dart';
import 'package:tag_pack/src/constants/strings.dart';
import 'package:tag_pack/src/model/WashAdviceModel.dart';
import 'package:tag_pack/src/widgets/galery_items.dart';

class AdviceItem extends StatefulWidget {
  AdviceItem({Key? key, required this.data, this.needToHideTitle})
      : super(key: key);

  WashAdviceModel data;
  bool? needToHideTitle;

  @override
  State<AdviceItem> createState() => _AdviceItemState();
}

class _AdviceItemState extends State<AdviceItem> {
  Widget _createTitleContainer() {
    return widget.needToHideTitle != true
        ? Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.colorDark),
                      borderRadius: BorderRadius.circular(6),
                      image: DecorationImage(
                          image: AssetImage(widget.data.iconPath),
                          fit: BoxFit.cover)),
                ),
                const Padding(padding: EdgeInsets.only(left: 6)),
                Text(
                  'Advice from ${widget.data.adviceOwnerName}',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          )
        : Container();
  }

  Widget _createDifficultyContainer(String? difficulty) {
    return difficulty != null
        ? Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              'Difficulty of deduction: $difficulty',
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 14),
            ),
          )
        : Container();
  }

  Widget _createWillNeedContainer(List<String>? willNeed) {
    return willNeed != null
        ? Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  Strings.will_need,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: willNeed.length,
                    itemBuilder: (BuildContext context, int needIndex) {
                      return Row(
                        children: [
                          const Icon(
                            Icons.circle,
                            color: Colors.black,
                            size: 4,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              willNeed[needIndex],
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      );
                    })
              ],
            ))
        : Container();
  }

  Widget _createCleaningMethodContainer(String? cleaningMethod) {
    return cleaningMethod != null
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  Strings.cleaning_method,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  cleaningMethod,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          )
        : Container();
  }

  Widget _createDescriptionContainer(String? description) {
    return description != null
        ? Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              description,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          )
        : Container();
  }

  Widget _createPhotosContainer(List<String>? photos) {
    return photos != null
        ? GalleryItems(
            items: photos,
          )
        : Container();
  }

  Widget _createStatsContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Icon(Icons.thumb_up, size: 20, color: AppColors.colorDark),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            widget.data.likesCount.toString(),
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child: const Icon(
              Icons.thumb_down_outlined,
              size: 20,
              color: AppColors.colorDark,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            widget.data.dislikesCount.toString(),
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child: const Icon(
              Icons.mode_comment_outlined,
              size: 20,
              color: AppColors.colorDark,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            widget.data.commentCount.toString(),
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.beige,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1, color: AppColors.colorDark)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _createTitleContainer(),
            _createDifficultyContainer(widget.data.difficulty),
            _createWillNeedContainer(widget.data.willNeed),
            _createCleaningMethodContainer(widget.data.cleaningMethod),
            _createDescriptionContainer(widget.data.description),
            _createPhotosContainer(widget.data.photos),
            _createStatsContainer()
          ],
        ),
      ),
    );
  }
}
