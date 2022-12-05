import 'package:flutter/material.dart';
import 'package:tag_pack/src/constants/AppColors.dart';
import 'package:tag_pack/src/constants/strings.dart';
import 'package:tag_pack/src/model/Enums.dart';
import 'package:tag_pack/src/widgets/stain_item.dart';

class Stain extends StatefulWidget {
  Stain({Key? key, this.type, required this.selectStainAction})
      : super(key: key);

  StainType? type;

  Function(StainType? type) selectStainAction;

  @override
  State<Stain> createState() => _StainState();
}

class _StainState extends State<Stain> {
  int _selectedItemIndex = -1;

  @override
  Widget build(BuildContext context) {
    if (widget.type != null) {
      _selectedItemIndex = StainType.values.indexOf(widget.type!);
    }

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        backgroundColor: AppColors.backgroundColor,
        title: const Text(
          Strings.stain_screen_title,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          color: AppColors.backgroundColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GridView.count(
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 0.74,
                  children: List.generate(StainType.values.length, (index) {
                    return InkWell(
                      onTap: () {
                        widget.selectStainAction(StainType.values[index]);
                        Navigator.of(context).pop();
                      },
                      child: ChoseStainItem(
                          type: StainType.values[index],
                          isSelected: _selectedItemIndex == index),
                    );
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
