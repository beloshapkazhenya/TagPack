import 'package:flutter/material.dart';
import 'package:tag_pack/src/constants/AppColors.dart';
import 'package:tag_pack/src/constants/assets.dart';
import 'package:tag_pack/src/model/TagInfoModel.dart';
import 'package:tag_pack/src/repository/repository.dart';
import 'package:tag_pack/src/screens/home/taginformation/tag_information.dart';
import 'package:tag_pack/src/screens/home/widgets/home_list_item.dart';
import 'package:tag_pack/src/utils/utils.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TagInfoModel _tagInfo = DataRepository().getTagInfo();

  final _tagsList = DataRepository().getTagsList();

  void onTagClicked() {
    Navigator.of(context).push(getPageRouterWithHorizontalTransition(
        TagInformation(data: _tagInfo),
        animationDuration: 250));
  }

  @override
  Widget build(BuildContext context) {
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
              decoration: const BoxDecoration(color: AppColors.backgroundColor),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child:
                    HomeListItem(tags: _tagsList, tagClickAction: onTagClicked),
              )),
        ));
  }
}
