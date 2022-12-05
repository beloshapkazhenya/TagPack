class WashAdviceModel {
  String iconPath;
  String adviceOwnerName;
  String? difficulty;
  List<String>? willNeed;
  String? cleaningMethod;
  int likesCount;
  int dislikesCount;
  int commentCount;
  List<String>? photos;
  String? description;
  List<CommentModel>? comments;

  WashAdviceModel(
      this.iconPath,
      this.adviceOwnerName,
      this.difficulty,
      this.willNeed,
      this.cleaningMethod,
      this.likesCount,
      this.dislikesCount,
      this.commentCount,
      this.photos,
      this.description,
      this.comments);
}

class CommentModel {
  String ownerName;
  String comment;
  String iconPath;

  CommentModel(this.ownerName, this.comment, this.iconPath);
}
