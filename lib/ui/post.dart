import 'package:flutter/material.dart';

import '../model/post.dart';

class PostDetailPage extends StatelessWidget {
  PostDetailPage({@required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: PostItem(post: post),
        ),
      ),
    );
  }
}

class PostItem extends StatelessWidget {
  const PostItem({@required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          post.title,
          style: Theme.of(context).textTheme.headline,
        ),
        SizedBox(height: 8.0),
        Text(
          post.body,
          style: Theme.of(context).textTheme.body1,
        ),
      ],
    );
  }
}
