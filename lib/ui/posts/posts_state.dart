import 'package:equatable/equatable.dart';
import 'package:flatter/model/post.dart';
import 'package:flatter/util/resource.dart';

class PostsState extends Equatable {
  final Resource status;
  final List<Post> posts;

  const PostsState({
    this.status = Resource.initial,
    this.posts = const [],
  });

  @override
  List<Object> get props => [status, posts];

  PostsState copyWith({
    Resource? status,
    List<Post>? posts,
  }) {
    return PostsState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
    );
  }
}
