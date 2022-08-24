import 'package:equatable/equatable.dart';
import 'package:plants_odc/features/forum/data/model/forum_comment_model.dart';
import 'package:plants_odc/features/forum/data/model/forum_likes_model.dart';

class Forum extends Equatable{
  String? forumId;
  String? title;
  String? description;
  String? imageUrl;
  String? userId;
  List<ForumLikesModel>? forumLikes;
  List<ForumCommentsModel>? forumComments;

  Forum(
      {this.forumId,
      this.title,
      this.description,
      this.imageUrl,
      this.userId,
      this.forumLikes,
      this.forumComments});
      
        @override
        List<Object?> get props => [forumId, title, description, imageUrl, userId, forumLikes,forumComments];

  
}