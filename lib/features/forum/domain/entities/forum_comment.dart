import 'package:equatable/equatable.dart';

class ForumComments extends Equatable {
  String? forumCommentId;
  String? forumId;
  String? userId;
  String? comment;
  String? createdAt;

  ForumComments(
      {this.forumCommentId,
      this.forumId,
      this.userId,
      this.comment,
      this.createdAt});
      
        @override
        // TODO: implement props
        List<Object?> get props => [forumCommentId, forumId, userId, comment,createdAt];
}