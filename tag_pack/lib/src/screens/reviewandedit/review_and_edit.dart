import 'package:flutter/material.dart';
import 'package:tag_pack/src/constants/AppColors.dart';
import 'package:tag_pack/src/constants/assets.dart';
import 'package:tag_pack/src/constants/strings.dart';
import 'package:tag_pack/src/model/CareModel.dart';
import 'package:tag_pack/src/model/NewTagCompositionModel.dart';
import 'package:tag_pack/src/model/NewTagModel.dart';
import 'package:tag_pack/src/screens/scan/scan.dart';
import 'package:tag_pack/src/utils/utils.dart';
import 'package:tag_pack/src/widgets/care_item.dart';
import 'package:tag_pack/src/widgets/wash_temperature_picker.dart';
import 'package:uuid/uuid.dart';

class ReviewAndEditTag extends StatefulWidget {
  const ReviewAndEditTag({Key? key}) : super(key: key);

  @override
  State<ReviewAndEditTag> createState() => _ReviewAndEditTagState();
}

class _ReviewAndEditTagState extends State<ReviewAndEditTag> {
  NewTagModel newTag = NewTagModel(
      'Fenty',
      [NewTagCompositionModel('Cotton', 100)],
      ['temperature', 'iron', 'spin', 'whitening']);

  List<CareModel> careList = [
    CareModel('assets/ic_laundry.png', Colors.purple, const Uuid().v4()),
    CareModel('assets/ic_ironing.png', Colors.pink, const Uuid().v4()),
    CareModel('assets/ic_spin.png', Colors.red, const Uuid().v4()),
    CareModel('assets/ic_bleaching.png', Colors.yellow, const Uuid().v4())
  ];

  final TextEditingController _brandNameController =
      TextEditingController(text: 'Fenty');

  void closeEditScreen(BuildContext context) {
    Navigator.of(context).pop();
  }

  void onDeleteCareItem(CareModel itemData) {
    setState(() {
      careList
          .remove(careList.firstWhere((element) => element.id == itemData.id));
    });
  }

  void rescan(BuildContext context) {
    Navigator.of(context).pushReplacement(getPageRouterWithHorizontalTransition(
        const Scan(),
        animationDuration: 300));
  }

  void onAddCareClicked(BuildContext context) {
    showAddCareBottomSheet(context);
  }

  void addCare() {
    setState(() {
      careList.add(
          CareModel('assets/ic_laundry.png', Colors.purple, const Uuid().v4()));
    });
    Navigator.pop(context);
  }

  void onRemoveCareClicked(BuildContext context, CareModel? model) {
    if (model != null) {
      onDeleteCareItem(model);
    } else {
      Navigator.pop(context);
    }
  }

  void showAddCareBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Container(
            color: AppColors.black10,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.beige,
                border: Border.all(
                  width: 1,
                  color: Colors.black,
                  style: BorderStyle.solid,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                  bottomLeft: Radius.zero,
                  bottomRight: Radius.zero,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: Image(image: AssetImage(Assets.bottom_sheet_btn)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 26, bottom: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.purple),
                        child: const Image(
                          image: AssetImage(Assets.ic_laundry),
                          width: 140,
                          height: 140,
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    Strings.wash_temperature,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 20)),
                  const WashTemperaturePicker(),
                  Padding(
                    padding: const EdgeInsets.only(top: 38, bottom: 12),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 32,
                      height: 46,
                      child: OutlinedButton(
                        onPressed: () => onRemoveCareClicked(context, null),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            )),
                            side: MaterialStateProperty.all(const BorderSide(
                              color: AppColors.colorDark,
                              width: 1,
                            ))),
                        child: const Text(
                          Strings.remove,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 32,
                      height: 46,
                      child: ElevatedButton(
                        onPressed: () => addCare(),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppColors.colorDark),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(12.0)))),
                        child: const Text(
                          Strings.done,
                          style: TextStyle(
                            color: AppColors.backgroundColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void continueScanning(BuildContext context) {
    Navigator.of(context).pop();
  }

  void onAddCompositionTapped(BuildContext context) {
    showAddCompositionBottomSheet(context);
  }

  void onOverviewItemTap(int index) {
    print('item $index tapped');
  }

  void onRemoveClicked(BuildContext context) {
    Navigator.pop(context);
  }

  void onDoneClicked(BuildContext context) {
    setState(() {
      newTag.composition.add(NewTagCompositionModel('new composition', 99));
    });
    Navigator.pop(context);
  }

  double _additionCompositionPercent = 100;

  void showAddCompositionBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return Container(
              color: const Color.fromRGBO(0, 0, 0, 0.1),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.beige,
                  border: Border.all(
                    width: 1,
                    color: Colors.black,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0),
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.zero,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Image(image: AssetImage(Assets.bottom_sheet_btn)),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 26, bottom: 8),
                        child: Container(
                          width: 140,
                          height: 140,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.black),
                              borderRadius: BorderRadius.circular(6),
                              image: const DecorationImage(
                                  image: AssetImage(Assets.cotton),
                                  fit: BoxFit.cover)),
                        )),
                    const Text(
                      Strings.cotton,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    Text(
                      '${_additionCompositionPercent.round()}%',
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    Slider(
                        value: _additionCompositionPercent,
                        max: 100,
                        activeColor: AppColors.colorDark,
                        thumbColor: AppColors.colorDark,
                        min: 0,
                        onChanged: (double value) {
                          setState(() {
                            _additionCompositionPercent = value;
                          });
                        }),
                    Padding(
                      padding: const EdgeInsets.only(top: 38, bottom: 12),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 32,
                        height: 46,
                        child: OutlinedButton(
                          onPressed: () => onRemoveClicked(context),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              )),
                              side: MaterialStateProperty.all(const BorderSide(
                                color: AppColors.colorDark,
                                width: 1,
                              ))),
                          child: const Text(
                            Strings.remove,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 32),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 32,
                        height: 46,
                        child: ElevatedButton(
                          onPressed: () => onDoneClicked(context),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColors.colorDark),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(12.0)))),
                          child: const Text(
                            Strings.done,
                            style: TextStyle(
                              color: AppColors.backgroundColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }

  void deleteItemFromOverview(int index) {
    setState(() {
      newTag.composition.removeAt(index);
    });
  }

  @override
  void dispose() {
    _brandNameController.dispose();
    super.dispose();
  }

  Widget _createBottomBtns() {
    return Row(
      children: [
        TextButton(
          onPressed: () => rescan(context),
          child: SizedBox(
            width: (MediaQuery.of(context).size.width) / 2 - 32,
            height: 46,
            child: const Center(
              child: Text(
                Strings.rescan,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: (MediaQuery.of(context).size.width - 32) / 2,
          height: 46,
          child: ElevatedButton(
            onPressed: () => continueScanning(context),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(AppColors.colorDark),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)))),
            child: const Text(
              Strings.text_continue,
              style: TextStyle(
                color: AppColors.backgroundColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _createOverviewList() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        if (index == newTag.composition.length) {
          return _createAddCompositionBtn();
        }

        return Card(
          color: AppColors.beige,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: AppColors.colorDark,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
              onTap: () => onOverviewItemTap(index),
              title: Text(
                '${newTag.composition[index].compositionPercent}% ${newTag.composition[index].compositionName}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              leading: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(6),
                    image: const DecorationImage(
                        image: AssetImage(Assets.cotton), fit: BoxFit.cover)),
              ),
              trailing: IconButton(
                onPressed: () => deleteItemFromOverview(index),
                icon: const Icon(
                  Icons.close,
                  color: AppColors.colorDark,
                ),
              )),
        );
      },
      itemCount: newTag.composition.length + 1,
    );
  }

  Widget _createAddCompositionBtn() {
    return InkWell(
      onTap: () => onAddCompositionTapped(context),
      child: Card(
        color: AppColors.beige,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: AppColors.colorDark,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(
                Icons.add,
                color: AppColors.gray60,
              ),
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: Text(
                  Strings.add_composition,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.gray60,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _createCareList() {
    return GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(careList.length + 1, (index) {
        if (index == careList.length) {
          return InkWell(
            onTap: () => onAddCareClicked(context),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
                borderRadius: BorderRadius.circular(12.0),
                color: AppColors.beige,
              ),
              clipBehavior: Clip.antiAlias,
              margin: const EdgeInsets.all(6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.add,
                    color: AppColors.gray60,
                  ),
                  Text(
                    Strings.add_care,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.gray60),
                  )
                ],
              ),
            ),
          );
        }

        return CareItem(
            data: careList[index], deleteBtnAction: onDeleteCareItem);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            Strings.review_and_edit,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: AppColors.backgroundColor,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () => closeEditScreen(context),
                icon: const Icon(
                  Icons.close,
                  color: Colors.black,
                ))
          ],
        ),
        body: Container(
            color: AppColors.backgroundColor,
            child: ScrollConfiguration(
                behavior: ScrollBehaviorWithoutGlow(),
                child: SingleChildScrollView(
                    child: ConstrainedBox(
                  constraints: BoxConstraints(
                      minHeight: viewportConstraints.maxHeight - 88),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              Strings.review_and_edit_hint,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 26, bottom: 16),
                              child: Text(
                                Strings.brand,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            TextFormField(
                              controller: _brandNameController
                                ..text = newTag.newTagName,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0)),
                                fillColor: AppColors.beige,
                                filled: true,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 26, bottom: 16),
                              child: Text(
                                Strings.overview,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            _createOverviewList(),
                            const Padding(
                              padding: EdgeInsets.only(top: 26, bottom: 16),
                              child: Text(
                                Strings.care,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            _createCareList()
                          ],
                        ),
                        _createBottomBtns()
                      ],
                    ),
                  ),
                )))),
      );
    });
  }
}
