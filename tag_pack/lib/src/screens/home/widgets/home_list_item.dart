import 'package:flutter/material.dart';
import 'package:tag_pack/src/model/TagItemModel.dart';
import 'package:tag_pack/src/utils/utils.dart';
import 'package:tag_pack/src/widgets/tag_item/tag_card_item.dart';

class HomeListItem extends StatefulWidget {
  HomeListItem({Key? key, required this.tags, required this.tagClickAction})
      : super(key: key);

  Function() tagClickAction;
  List<Object> tags;

  @override
  State<HomeListItem> createState() => _HomeListItemState();
}

class _HomeListItemState extends State<HomeListItem> {
  late List<Object> _tagsList;

  @override
  void initState() {
    super.initState();
    _tagsList = widget.tags;
  }

  Widget _createListTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
        behavior: ScrollBehaviorWithoutGlow(),
        child: ListView.separated(
          itemBuilder: (context, index) {
            var _tagItem = _tagsList[index];

            if (_tagItem is String) {
              return _createListTitle(_tagItem);
            } else if (_tagItem is TagItemModel) {
              return TagCardItem(
                  tagData: _tagItem, itemTapAction: widget.tagClickAction);
            }

            return Container();
          },
          separatorBuilder: (context, index) => const SizedBox(
            height: 8,
          ),
          itemCount: _tagsList.length,
          shrinkWrap: true,
        ));
  }
}
