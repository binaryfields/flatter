import 'package:flatter/model/post.dart';
import 'package:flutter/material.dart';

class PostsList extends StatelessWidget {
  final List<Post> posts;
  final void Function(BuildContext, Post) onItemTap;

  const PostsList({
    super.key,
    required this.posts,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('User ${posts[index].userId}'),
          subtitle: Text(posts[index].title),
          onTap: () => onItemTap(context, posts[index]),
        );
      },
    );
  }
}
