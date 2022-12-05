import 'package:tag_pack/src/model/NewTagCompositionModel.dart';

class NewTagModel {
  String newTagName;
  List<NewTagCompositionModel> composition;
  List<String> care;

  NewTagModel(this.newTagName, this.composition, this.care);
}
