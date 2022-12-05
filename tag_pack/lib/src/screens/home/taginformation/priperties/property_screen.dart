import 'package:flutter/material.dart';
import 'package:tag_pack/src/constants/AppColors.dart';
import 'package:tag_pack/src/constants/assets.dart';
import 'package:tag_pack/src/model/TagInfoModel.dart';
import 'package:tag_pack/src/utils/utils.dart';

class PropertyPart extends StatefulWidget {
  PropertyPart({Key? key, required this.properties}) : super(key: key);

  List<PropertyItem> properties;

  @override
  State<PropertyPart> createState() => _PropertyPartState();
}

class _PropertyPartState extends State<PropertyPart> {
  late List<PropertyItem> _properties;

  @override
  void initState() {
    super.initState();
    _properties = widget.properties;
  }

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
        padding: const EdgeInsets.all(16),
        child: ScrollConfiguration(
            behavior: ScrollBehaviorWithoutGlow(),
            child: SingleChildScrollView(
              child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: AppColors.beige,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.black, width: 1)),
                      width: MediaQuery.of(context).size.width - 32,
                      child: ExpansionPanelList(
                        elevation: 0,
                        expandedHeaderPadding: const EdgeInsets.only(bottom: 0),
                        animationDuration: const Duration(milliseconds: 600),
                        children: [
                          ExpansionPanel(
                              backgroundColor: AppColors.beige,
                              canTapOnHeader: true,
                              headerBuilder:
                                  (BuildContext context, bool isExpanded) {
                                return ListTile(
                                  leading: Container(
                                    width: 36,
                                    height: 36,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.black),
                                        borderRadius: BorderRadius.circular(6),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                _properties[index].iconPath),
                                            fit: BoxFit.cover)),
                                  ),
                                  title: Text(
                                    _properties[index].propertyName,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                );
                              },
                              body: Padding(
                                padding:
                                    const EdgeInsets.only(left: 70, right: 44),
                                child: Text(
                                  _properties[index].propertyDescription,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black),
                                ),
                              ),
                              isExpanded: _properties[index].isExpanded)
                        ],
                        expansionCallback: (int item, bool status) {
                          setState(() {
                            _properties[index].isExpanded =
                                !_properties[index].isExpanded;
                          });
                        },
                      ),
                    );
                  },
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 8,
                      ),
                  itemCount: _properties.length),
            )),
      ),
    );
  }
}
