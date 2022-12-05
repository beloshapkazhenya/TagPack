import 'package:flutter/material.dart';
import 'package:tag_pack/src/constants/AppColors.dart';
import 'package:tag_pack/src/constants/assets.dart';
import 'package:tag_pack/src/constants/strings.dart';
import 'package:tag_pack/src/model/Enums.dart';
import 'package:tag_pack/src/model/WashItemModel.dart';
import 'package:tag_pack/src/repository/repository.dart';
import 'package:tag_pack/src/screens/wash/fabric/fabric.dart';
import 'package:tag_pack/src/screens/wash/recommendations/recommendations.dart';
import 'package:tag_pack/src/screens/wash/stain/stain.dart';
import 'package:tag_pack/src/utils/utils.dart';
import 'package:tag_pack/src/widgets/chose_item.dart';
import 'package:tag_pack/src/widgets/stain_item.dart';
import 'package:tag_pack/src/widgets/wash_card.dart';

class Wash extends StatefulWidget {
  const Wash({Key? key}) : super(key: key);

  @override
  State<Wash> createState() => _WashState();
}

class _WashState extends State<Wash> {
  StainType? _stainType;
  FabricType? _fabricType;

  String _stainTitle = Strings.chose_stain;
  String _stainImagePath = Assets.chose_stain;
  String _fabricTitle = Strings.chose_thing;
  String _fabricImagePath = Assets.chose_thing;

  bool _isBtnGetRecommendationAvailable = false;

  final List<Object> _washItems = DataRepository().getWashItems();

  void onStainSelected(StainType? stainType) {
    setState(() {
      if (stainType != null) {
        _stainTitle = getStainTitleByType(stainType);
        _stainImagePath = getStainImagePathByType(stainType);
        _stainType = stainType;
      } else {
        _stainType = null;
      }

      checkForBtnGetRecommendationAvailable();
    });
  }

  void onRecommendationClicked(WashItemModel itemModel) {
    print('recomendation: ${itemModel.title}');
  }

  void onFabricSelected(FabricType? fabricType) {
    setState(() {
      if (fabricType != null) {
        _fabricTitle = getFabricTitleByType(fabricType);
        _fabricImagePath = getFabricImagePathByType(fabricType);
        _fabricType = fabricType;
      } else {
        _stainType = null;
      }

      checkForBtnGetRecommendationAvailable();
    });
  }

  void checkForBtnGetRecommendationAvailable() {
    setState(() {
      if (_stainType != null || _fabricType != null) {
        _isBtnGetRecommendationAvailable = true;
      } else {
        _isBtnGetRecommendationAvailable = false;
      }
    });
  }

  void openStainChooser() {
    Navigator.of(context).push(getPageRouterWithHorizontalTransition(
        Stain(
          selectStainAction: onStainSelected,
          type: _stainType,
        ),
        animationDuration: 250));
  }

  void onGetRecommendationClicked() {
    Navigator.of(context).push(getPageRouterWithHorizontalTransition(
        const Recommendations(),
        animationDuration: 250));
  }

  void openThingChooser() {
    Navigator.of(context).push(getPageRouterWithHorizontalTransition(
        Fabric(
          selectFabricAction: onFabricSelected,
          type: _fabricType,
        ),
        animationDuration: 250));
  }

  Widget _createChooserField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ChoseItem(
          choseTitle: _stainTitle,
          chosenItemImagePath: _stainImagePath,
          onItemClicked: openStainChooser,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Icon(
            Icons.add,
            size: 18,
            color: AppColors.colorDark,
          ),
        ),
        ChoseItem(
          choseTitle: _fabricTitle,
          chosenItemImagePath: _fabricImagePath,
          onItemClicked: openThingChooser,
        ),
      ],
    );
  }

  Widget _createBtnGetRecommendations() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 32,
        height: 46,
        child: ElevatedButton(
          onPressed: _isBtnGetRecommendationAvailable
              ? () {
                  onGetRecommendationClicked();
                }
              : null,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  _isBtnGetRecommendationAvailable
                      ? AppColors.colorDark
                      : AppColors.colorDark60),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)))),
          child: const Text(
            'Get washing recommendation',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.backgroundColor),
          ),
        ),
      ),
    );
  }

  Widget _createWashCards() {
    return ListView.separated(
      itemBuilder: (context, index) {
        var item = _washItems[index];

        if (item is String) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                item,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ),
          );
        } else if (item is WashItemModel) {
          return WashCard(
              data: item, actionOnItemClicked: onRecommendationClicked);
        }

        return Container();
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 8,
      ),
      itemCount: _washItems.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          centerTitle: true,
          elevation: 0,
          title: const Text(
            Strings.wash,
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black),
          ),
        ),
        body: SafeArea(
          child: Container(
            color: AppColors.backgroundColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ScrollConfiguration(
                behavior: ScrollBehaviorWithoutGlow(),
                child: SingleChildScrollView(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    children: [
                      _createChooserField(),
                      _createBtnGetRecommendations(),
                      Padding(
                        padding: const EdgeInsets.only(top: 26),
                        child: _createWashCards(),
                      ),
                    ],
                  ),
                )),
              ),
            ),
          ),
        ));
  }
}
