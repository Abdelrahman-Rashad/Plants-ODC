import '../../domain/entities/forum_comment.dart';

class ForumCommentsModel extends ForumComments{


  ForumCommentsModel(
      {super.forumCommentId,
      super.forumId,
      super.userId,
      super.comment,
      super.createdAt});

   ForumCommentsModel.fromJson(Map<String, dynamic> json) {
    forumCommentId = json['forumCommentId'];
    forumId = json['forumId'];
    userId = json['userId'];
    comment = json['comment'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['forumCommentId'] = forumCommentId;
    data['forumId'] = forumId;
    data['userId'] = userId;
    data['comment'] = comment;
    data['createdAt'] = createdAt;
    return data;
  }
}