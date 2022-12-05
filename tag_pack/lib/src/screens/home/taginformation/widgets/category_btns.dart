import 'package:flutter/material.dart';
import 'package:tag_pack/src/constants/strings.dart';
import 'package:tag_pack/src/widgets/tag_information_category_item.dart';

class CategoryBtnsWidget extends StatefulWidget {
  CategoryBtnsWidget({Key? key, required this.onCategorySelected})
      : super(key: key);

  Function(int index) onCategorySelected;

  @override
  State<CategoryBtnsWidget> createState() => _CategoryBtnsWidgetState();
}

class _CategoryBtnsWidgetState extends State<CategoryBtnsWidget> {
  int _selectedIndex = 0;

  void selectCategory(int index) {
    setState(() {
      _selectedIndex = index;
    });

    widget.onCategorySelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                selectCategory(0);
              },
              child: TagInformationCategoryItem(
                  isSelected: _selectedIndex == 0, title: Strings.overview),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                selectCategory(1);
              },
              child: TagInformationCategoryItem(
                  isSelected: _selectedIndex == 1, title: Strings.properties),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                selectCategory(2);
              },
              child: TagInformationCategoryItem(
                  isSelected: _selectedIndex == 2, title: Strings.care),
            ),
          ),
        ],
      ),
    );
  }
}
