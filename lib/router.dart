import 'package:flatter/model/post.dart';
import 'package:go_router/go_router.dart';

import 'ui/login/login_page.dart';
import 'ui/posts/post_detail_page.dart';
import 'ui/posts/posts_page.dart';
import 'ui/settings/settings_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/posts',
      builder: (context, state) => const PostsPage(),
    ),
    GoRoute(
      path: '/posts/:id',
      builder: (context, state) {
        final post = state.extra as Post;
        return PostDetailPage(post: post);
      },
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsPage(),
    ),
  ],
);
