import 'package:plants_odc/features/forum/data/model/forum_comment_model.dart';
import 'package:plants_odc/features/forum/data/model/forum_likes_model.dart';
import 'package:plants_odc/features/forum/domain/entities/forum.dart';

class ForumModel extends Forum{


  ForumModel(
      {super.forumId,
      super.title,
      super.description,
      super.imageUrl,
      super.userId,
      super.forumLikes,
      super.forumComments});

  ForumModel.fromJson(Map<String, dynamic> json) {
    forumId = json['forumId'];
    title = json['title'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    userId = json['userId'];
    if (json['ForumLikes'] != null) {
      forumLikes = <ForumLikesModel>[];
      json['ForumLikes'].forEach((v) {
        forumLikes!.add(ForumLikesModel.fromJson(v));
      });
    }
    if (json['ForumComments'] != null) {
      forumComments = <ForumCommentsModel>[];
      json['ForumComments'].forEach((v) {
        forumComments!.add( ForumCommentsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['forumId'] = forumId;
    data['title'] = title;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    data['userId'] = userId;
    if (forumLikes != null) {
      data['ForumLikes'] = forumLikes!.map((v) => v.toJson()).toList();
    }
    if (forumComments != null) {
      data['ForumComments'] =
          forumComments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}