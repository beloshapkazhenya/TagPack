import 'package:flutter/material.dart';
import 'package:tag_pack/src/constants/AppColors.dart';
import 'package:tag_pack/src/constants/assets.dart';
import 'package:tag_pack/src/constants/strings.dart';
import 'package:tag_pack/src/model/Enums.dart';
import 'package:tag_pack/src/widgets/fabric_item.dart';

class Fabric extends StatefulWidget {
  Fabric({Key? key, this.type, required this.selectFabricAction})
      : super(key: key);

  FabricType? type;

  Function(FabricType? type) selectFabricAction;

  @override
  State<Fabric> createState() => _FabricState();
}

class _FabricState extends State<Fabric> {
  int _selectedItemIndex = -1;

  @override
  Widget build(BuildContext context) {
    if (widget.type != null) {
      _selectedItemIndex = FabricType.values.indexOf(widget.type!);
    }

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        backgroundColor: AppColors.backgroundColor,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          Strings.fabric_screen_title,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: AppColors.backgroundColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      width: (MediaQuery.of(context).size.width - 44) / 2,
                      height: (MediaQuery.of(context).size.width - 44) / 2,
                      decoration: BoxDecoration(
                          color: AppColors.beige,
                          borderRadius: BorderRadius.circular(12),
                          border:
                              Border.all(width: 1, color: AppColors.colorDark)),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Image(
                                image: AssetImage(
                                    Assets.ic_nav_saved_active)),
                            Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: Text(
                                Strings.select_from_saved,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                    ),
                    Container(
                      width: (MediaQuery.of(context).size.width - 44) / 2,
                      height: (MediaQuery.of(context).size.width - 44) / 2,
                      decoration: BoxDecoration(
                          color: AppColors.beige,
                          borderRadius: BorderRadius.circular(12),
                          border:
                              Border.all(width: 1, color: AppColors.colorDark)),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Image(
                                image: AssetImage(Assets.ic_scan_active)),
                            Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: Text(
                                Strings.scan_label,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 26, bottom: 16),
                  child: Text(
                    Strings.select_from_list,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ),
                GridView.count(
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 0.74,
                  children: List.generate(FabricType.values.length, (index) {
                    return InkWell(
                      onTap: () {
                        widget.selectFabricAction(FabricType.values[index]);
                        Navigator.of(context).pop();
                      },
                      child: ChoseFabricItem(
                          type: FabricType.values[index],
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
