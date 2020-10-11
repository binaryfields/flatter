part of 'posts_bloc.dart';

class PostsState extends Equatable {
  const PostsState({this.status = Resource.initial, this.posts});

  final Resource status;
  final List<Post> posts;

  @override
  List<Object> get props => [status, posts];

  PostsState copyWith({
    Resource status,
    List<Post> posts,
  }) {
    return PostsState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
    );
  }
}
