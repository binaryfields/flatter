import 'package:bloc/bloc.dart';
import 'package:flatter/service/post_service.dart';
import 'package:flatter/util/resource.dart';
import 'package:logger/logger.dart';

import 'posts_state.dart';

class PostsBloc extends Cubit<PostsState> {
  static final logger = Logger();
  final PostService postService;

  PostsBloc({required this.postService}) : super(const PostsState());

  Future<void> fetch() async {
    try {
      emit(state.copyWith(posts: const Loading()));
      final posts = await postService.fetch();
      emit(state.copyWith(posts: Success(posts)));
    } catch (e, st) {
      logger.e("Failed to fetch posts", error: e, stackTrace: st);
      emit(state.copyWith(posts: Failure(e.toString())));
    }
  }
}
