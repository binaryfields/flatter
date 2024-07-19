import 'package:equatable/equatable.dart';
import 'package:flatter/model/post.dart';
import 'package:flatter/util/resource.dart';

class PostsState extends Equatable {
  final Resource<List<Post>> posts;

  const PostsState({this.posts = const Idle()});

  @override
  List<Object> get props => [posts];

  PostsState copyWith({
    Resource<List<Post>>? posts,
  }) {
    return PostsState(
      posts: posts ?? this.posts,
    );
  }
}
