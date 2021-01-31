import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flatter/model/post.dart';
import 'package:flatter/service/post_service.dart';
import 'package:flatter/util/resource.dart';

part 'posts_state.dart';

class PostsBloc extends Cubit<PostsState> {
  PostsBloc({required this.postService}) : super(PostsState());

  final PostService postService;

  Future<void> fetch() async {
    try {
      emit(state.copyWith(status: Resource.loading));
      final posts = await postService.fetch();
      emit(state.copyWith(status: Resource.success, posts: posts));
    } on Exception {
      emit(state.copyWith(status: Resource.error));
    }
  }
}
