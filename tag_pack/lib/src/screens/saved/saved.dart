import 'package:flutter/material.dart';
import 'package:tag_pack/src/constants/AppColors.dart';
import 'package:tag_pack/src/constants/assets.dart';
import 'package:tag_pack/src/model/TagItemModel.dart';
import 'package:tag_pack/src/repository/repository.dart';
import 'package:tag_pack/src/utils/utils.dart';
import 'package:tag_pack/src/widgets/tag_item/tag_card_item.dart';

class Saved extends StatefulWidget {
  const Saved({Key? key}) : super(key: key);

  @override
  State<Saved> createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  void onTagClicked() {
    print('tag clicked');
  }

  List<TagItemModel> _savedTags = List.empty();

  @override
  void initState() {
    super.initState();
    getSavedTags();
  }

  getSavedTags() async {
    DataRepository().getSavedTags().then((value) => {setSavedTags(value)});
  }

  setSavedTags(tags) {
    setState(() {
      _savedTags = tags;
    });
  }

  Widget _createSavedTagsList() {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(
        height: 8,
      ),
      shrinkWrap: true,
      itemCount: _savedTags.length,
      itemBuilder: (context, index) {
        return TagCardItem(
            tagData: _savedTags[index], itemTapAction: onTagClicked);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return Scaffold(
          appBar: AppBar(
              backgroundColor: AppColors.backgroundColor,
              centerTitle: true,
              elevation: 0,
              title: const Image(
                image: AssetImage(Assets.logo_small),
              )),
          body: SafeArea(
            child: Container(
                height: viewportConstraints.maxHeight,
                decoration:
                    const BoxDecoration(color: AppColors.backgroundColor),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: ScrollConfiguration(
                      behavior: ScrollBehaviorWithoutGlow(),
                      child: _createSavedTagsList()),
                )),
          ));
    });
  }
}
