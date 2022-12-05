import 'package:flutter/material.dart';
import 'package:tag_pack/src/constants/AppColors.dart';
import 'package:tag_pack/src/constants/assets.dart';
import 'package:tag_pack/src/constants/strings.dart';
import 'package:tag_pack/src/model/TagInfoModel.dart';
import 'package:tag_pack/src/model/TagItemModel.dart';
import 'package:tag_pack/src/repository/repository.dart';
import 'package:tag_pack/src/screens/home/taginformation/care/care_screen.dart';
import 'package:tag_pack/src/screens/home/taginformation/overview/overview_screen.dart';
import 'package:tag_pack/src/screens/home/taginformation/priperties/property_screen.dart';
import 'package:tag_pack/src/screens/home/taginformation/widgets/category_btns.dart';
import 'package:tag_pack/src/screens/home/taginformation/widgets/tag_header.dart';

class TagInformation extends StatefulWidget {
  TagInformation({Key? key, required this.data}) : super(key: key);

  TagInfoModel data;

  @override
  State<TagInformation> createState() => _TagInformationState();
}

class _TagInformationState extends State<TagInformation>
    with SingleTickerProviderStateMixin {
  late TagInfoModel _tagData;
  int _selectedCategoryIndex = 0;

  @override
  void initState() {
    super.initState();
    _tagData = widget.data;
  }

  Widget _getScreenOverviewByIndex() {
    switch (_selectedCategoryIndex) {
      case 0:
        return OverviewPart(composition: _tagData.composition);
      case 1:
        return PropertyPart(properties: _tagData.properties);
      case 2:
        return CarePart(
          difficulty: _tagData.difficulty,
          care: _tagData.care,
        );
      default:
        return OverviewPart(composition: _tagData.composition);
    }
  }

  saveTag() {
    setState(() {
      _tagData.isSaved = !_tagData.isSaved;
    });

    var repository = DataRepository();

    repository.saveTag(TagItemModel(
        _tagData.iconPath,
        _tagData.name,
        _tagData.composition.first.compositionName,
        getCompositionString(),
        _tagData.isSaved));
  }

  String getCompositionString() {
    String compositionString = '';
    for (var element in _tagData.composition) {
      compositionString +=
          '${element.compositionPercent}% ${element.compositionName}, ';
    }
    if (compositionString.length > 2) {
      compositionString =
          compositionString.substring(0, compositionString.length - 2);
    }

    return compositionString;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return Scaffold(
        appBar: AppBar(
          leading: const BackButton(color: Colors.black),
          backgroundColor: AppColors.backgroundColor,
          centerTitle: true,
          elevation: 0,
          title: const Text(
            Strings.tag_information,
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  saveTag();
                },
                icon: Image(
                    image: AssetImage(_tagData.isSaved
                        ? Assets.ic_nav_saved_active
                        : Assets.ic_nav_saved_inactive)))
          ],
        ),
        body: SafeArea(
          child: Container(
              color: AppColors.backgroundColor,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight - 88),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Column(
                    children: [
                      TagHeader(
                          name: _tagData.name, iconPath: _tagData.iconPath),
                      Expanded(
                          child: Column(
                        children: [
                          CategoryBtnsWidget(onCategorySelected: (index) {
                            setState(() {
                              _selectedCategoryIndex = index;
                            });
                          }),
                          Expanded(child: _getScreenOverviewByIndex())
                        ],
                      ))
                    ],
                  ),
                ),
              )),
        ),
      );
    });
  }
}
