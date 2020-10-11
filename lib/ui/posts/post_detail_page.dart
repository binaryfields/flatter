import 'package:flatter/model/post.dart';
import 'package:flatter/util/locale.dart';
import 'package:flutter/material.dart';

import 'post_detail_content.dart';

class PostDetailPage extends StatelessWidget {
  const PostDetailPage({this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n().postTitle),
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
