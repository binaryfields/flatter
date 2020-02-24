import 'package:flutter/material.dart';

import 'theme.dart';
import '../ui/posts.dart';

class FlatterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      theme: theme,
      home: PostsPage(),
    );
  }
}
