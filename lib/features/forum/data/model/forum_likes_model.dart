import '../../domain/entities/forum_likes.dart';

class ForumLikesModel extends ForumLikes{
  ForumLikesModel({super.forumId, super.userId});

  ForumLikesModel.fromJson(Map<String, dynamic> json) {
    forumId = json['forumId'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['forumId'] = forumId;
    data['userId'] = userId;
    return data;
  }
}