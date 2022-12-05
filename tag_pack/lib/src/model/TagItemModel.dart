import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class TagItemModel {
  @HiveField(0)
  String? iconPath;

  @HiveField(1)
  String tagName;

  @HiveField(2)
  String? naturalCompositionName;

  @HiveField(3)
  String composition;

  @HiveField(4)
  bool isSaved;

  TagItemModel(this.iconPath, this.tagName, this.naturalCompositionName,
      this.composition, this.isSaved);
}

class TagItemModelAdapter extends TypeAdapter<TagItemModel> {
  @override
  TagItemModel read(BinaryReader reader) {
    return TagItemModel(reader.read(), reader.read(), reader.read(),
        reader.read(), reader.read());
  }

  @override
  final int typeId = 0;

  @override
  void write(BinaryWriter writer, TagItemModel obj) {
    writer.write(obj.iconPath);
  }
}
