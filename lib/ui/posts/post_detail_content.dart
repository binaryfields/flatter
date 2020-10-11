import 'package:flatter/model/post.dart';
import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  const PostItem({this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          post.title,
          style: Theme.of(context).textTheme.headline5,
        ),
        SizedBox(height: 8),
        Text(
          post.body,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }
}
