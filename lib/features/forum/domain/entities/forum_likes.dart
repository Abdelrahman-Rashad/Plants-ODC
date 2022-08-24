import 'package:equatable/equatable.dart';

class ForumLikes extends Equatable{
  String? forumId;
  String? userId;

  ForumLikes({this.forumId, this.userId});
  
  @override
  List<Object?> get props => [forumId,userId];
}