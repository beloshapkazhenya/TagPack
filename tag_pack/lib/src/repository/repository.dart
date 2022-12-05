import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tag_pack/src/model/TagInfoModel.dart';
import 'package:tag_pack/src/model/TagItemModel.dart';
import 'package:tag_pack/src/model/UserModel.dart';
import 'package:tag_pack/src/model/WashItemModel.dart';

class DataRepository {
  List<Object> getWashItems() {
    return [
      'Today',
      WashItemModel('assets/stain_cosmetic.png', 'assets/fabric_blouse.png',
          'Modamir', 'Cosmetic', 'Flax', 'average'),
      'This week',
      WashItemModel('assets/stain_milk.png', 'assets/fabric_sweater.png',
          'Modamir', 'Milk', 'Cotton', 'easy'),
      WashItemModel('assets/stain_cosmetic.png', 'assets/fabric_blouse.png',
          'Modamir', 'Cosmetic', 'Flax', 'average'),
      WashItemModel('assets/stain_cosmetic.png', 'assets/fabric_blouse.png',
          'Modamir', 'Cosmetic', 'Flax', 'average'),
      WashItemModel('assets/stain_cosmetic.png', 'assets/fabric_blouse.png',
          'Modamir', 'Cosmetic', 'Flax', 'average'),
      WashItemModel('assets/stain_cosmetic.png', 'assets/fabric_blouse.png',
          'Modamir', 'Cosmetic', 'Flax', 'average'),
      WashItemModel('assets/stain_cosmetic.png', 'assets/fabric_blouse.png',
          'Modamir', 'Cosmetic', 'Flax', 'average'),
      WashItemModel('assets/stain_cosmetic.png', 'assets/fabric_blouse.png',
          'Modamir', 'Cosmetic', 'Flax', 'average'),
      WashItemModel('assets/stain_cosmetic.png', 'assets/fabric_blouse.png',
          'Modamir', 'Cosmetic', 'Flax', 'average')
    ];
  }

  UserModel getUserData() {
    return UserModel(
        'Mark', 'assets/default_avatar.jpg', 'Markmarkmark1@gmail.com');
  }

  saveTag(TagItemModel tag) async {
    var box = await Hive.openBox('default');
    List<TagItemModel>? savedTags = box.get('saved');
    if (savedTags != null) {
      savedTags.add(tag);
    } else {
      savedTags = [tag];
    }

    box.put('saved', savedTags);
  }

  Future<List<TagItemModel>> getSavedTags() async {
    var box = await Hive.openBox('default');
    return box.get('saved');
  }

  List<Object> getTagsList() {
    return [
      'Today',
      TagItemModel(
          'https://miro.medium.com/max/1200/1*mk1-6aYaf_Bes1E3Imhc0A.jpeg',
          'Amemoda',
          null,
          '65% Polyester, 28% Viscose, 6% Wool, 1% Lycra',
          true),
      TagItemModel(
          null, 'Signal', '90% Natural', '90% Cotton, 10% Elastan', false),
      'Yesterday',
      TagItemModel(null, 'Likeway', null,
          '65% Polyester, 28% Viscose, 6% Wool, 1% Lycra', true),
      TagItemModel(null, 'Erilike', null, '65% Polyester, 35% Viscose', true),
      TagItemModel(
          'https://upload.wikimedia.org/wikipedia/commons/9/9a/Gull_portrait_ca_usa.jpg',
          'Modamir',
          '80% Natural',
          '80% Cotton, 20% Elastan',
          false),
      'This week',
      TagItemModel('https://tinypng.com/images/social/website.jpg', 'Brendway',
          '100% Natural', '100% Cotton', true),
      TagItemModel(null, 'Erilike', null, '65% Polyester, 35% Viscose', true),
      TagItemModel(null, 'Erilike', null, '65% Polyester, 35% Viscose', true),
      TagItemModel(null, 'Erilike', null, '65% Polyester, 35% Viscose', true),
      TagItemModel(null, 'Erilike', null, '65% Polyester, 35% Viscose', true),
      TagItemModel(null, 'Erilike', null, '65% Polyester, 35% Viscose', true),
      TagItemModel(null, 'Erilike', null, '65% Polyester, 35% Viscose', true),
      TagItemModel(null, 'Erilike', null, '65% Polyester, 35% Viscose', true),
      TagItemModel(null, 'Erilike', null, '65% Polyester, 35% Viscose', true),
      TagItemModel(null, 'Erilike', null, '65% Polyester, 35% Viscose', true),
      TagItemModel(null, 'Erilike', null, '65% Polyester, 35% Viscose', true)
    ];
  }

  TagInfoModel getTagInfo() {
    return TagInfoModel(
        'Signal',
        'assets/wash_image_3.png',
        [
          ItemCompositionModel(
              'Cotton',
              'Natural',
              90,
              'Natural fabric, which is obtained from a special plant — cotton, using its fruits.',
              Colors.yellow,
              'assets/cotton.png'),
          ItemCompositionModel(
              'Elastan',
              'Synthetic',
              10,
              'Durable synthetic material created on the basis of thermoplastic polyurethane rubber.',
              Colors.purple,
              'assets/synthetic.png')
        ],
        [
          PropertyItem(
              'Protects the body from overheating and hypothermia',
              'Elevated air and body temperature leads to profuse sweating, which, in turn, creates considerable discomfort for a person. It is the high hygroscopicity of the fabric that allows you to get rid of excess moisture. This property is also an important indicator for manufacturers of everyday underwear.',
              'assets/ic_property_1.png'),
          PropertyItem(
              'Absorbs moisture well',
              'Elevated air and body temperature leads to profuse sweating, which, in turn, creates considerable discomfort for a person. It is the high hygroscopicity of the fabric that allows you to get rid of excess moisture. This property is also an important indicator for manufacturers of everyday underwear.',
              'assets/ic_property_2.png'),
          PropertyItem(
              'Does not cause allergic reactions on the body',
              'Elevated air and body temperature leads to profuse sweating, which, in turn, creates considerable discomfort for a person. It is the high hygroscopicity of the fabric that allows you to get rid of excess moisture. This property is also an important indicator for manufacturers of everyday underwear.',
              'assets/ic_property_3.png'),
          PropertyItem(
              'Does not fade',
              'Elevated air and body temperature leads to profuse sweating, which, in turn, creates considerable discomfort for a person. It is the high hygroscopicity of the fabric that allows you to get rid of excess moisture. This property is also an important indicator for manufacturers of everyday underwear.',
              'assets/ic_property_4.png'),
          PropertyItem(
              'Washes well',
              'Elevated air and body temperature leads to profuse sweating, which, in turn, creates considerable discomfort for a person. It is the high hygroscopicity of the fabric that allows you to get rid of excess moisture. This property is also an important indicator for manufacturers of everyday underwear.',
              'assets/ic_property_5.png')
        ],
        'average',
        [
          CareItem('Wash at a temperature not higher than 40',
              'assets/ic_laundry.png', Colors.purple),
          CareItem('Do not bleach', 'assets/ic_bleaching.png', Colors.yellow),
          CareItem(
              'Do not spin on a centrifuge', 'assets/ic_spin.png', Colors.red),
          CareItem('Iron at medium temperature (up to 150 degrees)',
              'assets/ic_ironing.png', Colors.pink),
        ],
        false);
  }
}
