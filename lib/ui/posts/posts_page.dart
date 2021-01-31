import 'package:flatter/model/post.dart';
import 'package:flatter/service/post_service.dart';
import 'package:flatter/ui/posts/post_detail_page.dart';
import 'package:flatter/util/locale.dart';
import 'package:flatter/util/resource.dart';
import 'package:flatter/widget/common.dart';
import 'package:flatter/widget/nav_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'posts_bloc.dart';
import 'posts_list.dart';

class PostsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostsBloc>(
      create: (_) => PostsBloc(
        postService: context.read<PostService>(),
      )..fetch(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(context.l10n().postsTitle),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: const Icon(Icons.refresh),
                  tooltip: context.l10n().actionRefresh,
                  onPressed: () => context.read<PostsBloc>().fetch(),
                ),
              ],
            ),
            drawer: NavDrawer(),
            body: BlocBuilder<PostsBloc, PostsState>(
              builder: (context, state) {
                switch (state.status) {
                  case Resource.initial:
                  case Resource.loading:
                    return const Center(child: CircularProgressIndicator());
                  case Resource.error:
                    return ErrorPrompt(
                      message: context.l10n().errorGeneric,
                      onRetry: () => context.read<PostsBloc>().fetch(),
                    );
                  default:
                    return RefreshIndicator(
                      onRefresh: () => context.read<PostsBloc>().fetch(),
                      child: state.posts?.isNotEmpty ?? false
                          ? PostsList(
                              posts: state.posts!,
                              onItemTap: _onItemTap,
                            )
                          : const NoContent(),
                    );
                }
              },
            ),
          );
        },
      ),
    );
  }

  void _onItemTap(BuildContext context, Post item) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PostDetailPage(post: item)),
    );
  }
}
