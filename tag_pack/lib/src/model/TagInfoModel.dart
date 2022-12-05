import 'dart:ui';

class TagInfoModel {
  String name;
  String iconPath;
  List<ItemCompositionModel> composition;
  List<PropertyItem> properties;
  String difficulty;
  List<CareItem> care;
  bool isSaved;

  TagInfoModel(this.name, this.iconPath, this.composition, this.properties,
      this.difficulty, this.care, this.isSaved);
}

class ItemCompositionModel {
  String compositionName;
  int compositionPercent;
  String compositionDescription;
  String compositionType;
  Color compositionColor;
  String compositionIconPath;

  ItemCompositionModel(
      this.compositionName,
      this.compositionType,
      this.compositionPercent,
      this.compositionDescription,
      this.compositionColor,
      this.compositionIconPath);
}

class PropertyItem {
  String propertyName;
  String propertyDescription;
  String iconPath;
  bool isExpanded = false;

  PropertyItem(this.propertyName, this.propertyDescription, this.iconPath);
}

class CareItem {
  String name;
  String iconPath;
  Color bgColor;

  CareItem(this.name, this.iconPath, this.bgColor);
}
