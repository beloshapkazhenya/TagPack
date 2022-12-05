import 'package:flutter/material.dart';
import 'package:tag_pack/src/constants/AppColors.dart';
import 'package:tag_pack/src/model/WashAdviceModel.dart';
import 'package:tag_pack/src/screens/wash/advice/advice_info.dart';
import 'package:tag_pack/src/utils/utils.dart';
import 'package:tag_pack/src/widgets/advice_item.dart';
import 'package:tag_pack/src/widgets/filter_item.dart';

class Recommendations extends StatefulWidget {
  const Recommendations({Key? key}) : super(key: key);

  @override
  State<Recommendations> createState() => _RecommendationsState();
}

class _RecommendationsState extends State<Recommendations> {
  List<WashAdviceModel> advices = [
    WashAdviceModel(
        'assets/ic_logo_small.png',
        'Tagpack',
        'average',
        ['water', 'alcahol'],
        'Mix a liter of water and 1 tablespoon of alcohol and soak the thing in this mixture, then rinse the cloth under running water and leave it to dry naturally.',
        101,
        6,
        4,
        null,
        null,
        [
          CommentModel('tagpack', 'test comment', 'assets/default_avatar.jpg'),
          CommentModel('tagpack', 'test comment', 'assets/default_avatar.jpg'),
          CommentModel('tagpack', 'test comment', 'assets/default_avatar.jpg'),
          CommentModel('tagpack', 'test comment', 'assets/default_avatar.jpg'),
          CommentModel('tagpack', 'test comment', 'assets/default_avatar.jpg')
        ]),
    WashAdviceModel(
        'assets/default_avatar.jpg',
        'Modnik33',
        null,
        null,
        null,
        45,
        3,
        1,
        [
          'assets/wash_image_1.png',
          'assets/wash_image_2.png',
          'assets/wash_image_3.png'
        ],
        'Vinegar is a great stain remover. Dilute one teaspoon of vinegar in several mugs of water and pour the resulting liquid on the stain.',
        [
          CommentModel('tagpack', 'test comment', 'assets/default_avatar.jpg'),
        ]),
    WashAdviceModel(
        'assets/default_avatar.jpg',
        'Modnik34',
        null,
        null,
        null,
        20,
        1,
        0,
        [
          'assets/wash_image_1.png',
          'assets/wash_image_2.png',
          'assets/wash_image_3.png',
          'assets/wash_image_2.png',
          'assets/wash_image_1.png',
        ],
        'Mix a liter of water and 1 tablespoon of alcohol and soak the thing in this mixture, then rinse the cloth under running water and leave it to dry naturally.',
        null),
  ];

  void onAdviceClicked(WashAdviceModel data) {
    Navigator.of(context).push(getPageRouterWithHorizontalTransition(
        AdviceInfo(data: data),
        animationDuration: 250));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        backgroundColor: AppColors.backgroundColor,
        title: const Text(
          'Washing recommendations',
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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ScrollConfiguration(
              behavior: ScrollBehaviorWithoutGlow(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.beige,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    width: 1, color: AppColors.colorDark)),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 64,
                                    height: 64,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color: AppColors.colorDark),
                                        borderRadius: BorderRadius.circular(12),
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                'assets/stain_coffee.png'),
                                            fit: BoxFit.contain)),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 8),
                                    child: Text(
                                      'Coffee',
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
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Icon(
                            Icons.add,
                            size: 18,
                            color: AppColors.colorDark,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.beige,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    width: 1, color: AppColors.colorDark)),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 64,
                                    height: 64,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color: AppColors.colorDark),
                                        borderRadius: BorderRadius.circular(12),
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                'assets/stain_coffee.png'),
                                            fit: BoxFit.contain)),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 8),
                                    child: Text(
                                      'Coffee',
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
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 26),
                      child: Row(
                        children: [
                          FilterItem(
                              actionOnItemClicked: () {
                                print('delete filter');
                              },
                              filterName: 'White',
                              filterType: 'Color'),
                          const Padding(padding: EdgeInsets.only(left: 8)),
                          FilterItem(
                              actionOnItemClicked: () {
                                print('delete filter');
                              },
                              filterName: 'No',
                              filterType: 'Print'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 12),
                      child: Container(
                        width: MediaQuery.of(context).size.width - 32,
                        decoration: BoxDecoration(
                            color: AppColors.beige,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                width: 1, color: AppColors.colorDark)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: AppColors.colorDark),
                                      borderRadius: BorderRadius.circular(6),
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/default_avatar.jpg'),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  decoration: const InputDecoration.collapsed(
                                      hintText: 'Add a post'),
                                  style: const TextStyle(
                                      color: AppColors.gray60,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              IconButton(
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 0),
                                  onPressed: () {
                                    print('add photo');
                                  },
                                  icon: const Icon(
                                    Icons.add_photo_alternate,
                                    size: 20,
                                    color: AppColors.colorDark,
                                  )),
                              IconButton(
                                  padding:
                                      const EdgeInsets.only(left: 10, right: 0),
                                  onPressed: () {
                                    print('add post');
                                  },
                                  icon: const Icon(
                                    Icons.send,
                                    color: AppColors.colorDark,
                                    size: 20,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 8,
                            ),
                        itemCount: advices.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () => onAdviceClicked(advices[index]),
                            child: AdviceItem(
                              data: advices[index],
                            ),
                          );
                        })
                  ],
                ),
              )),
        ),
      )),
    );
  }
}
