import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/post.dart';
import '../service/post.dart';
import '../util/widgets.dart';

import 'drawer.dart';
import 'post.dart';

// TODO fix onrefresh

class PostsPage extends StatefulWidget {
  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _postService = PostService(client: http.Client());

  Future<List<Post>> _postsFut;

  @override
  void initState() {
    super.initState();
    _postsFut = _postService.fetch();
  }

  void _retry() {
    setState(() {
      _postsFut = _postService.fetch();
    });
  }

  void _onItemTap(BuildContext context, Post item) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PostDetailPage(post: item)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Flatter'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh',
            onPressed: _retry,
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: FutureBuilder<List<Post>>(
        future: _postsFut,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return Error(
                  message: snapshot.error.toString(),
                  onRetry: _retry,
                );
              } else if (snapshot.data.isNotEmpty) {
                return RefreshIndicator(
                  child: PostList(
                    posts: snapshot.data,
                    onItemTap: _onItemTap,
                  ),
                  onRefresh: () {
                    _retry();
                    return _postsFut;
                  },
                );
              } else {
                return const NoContent();
              }
          }
        },
      ),
    );
  }
}

class PostList extends StatelessWidget {
  PostList({Key key, this.posts, this.onItemTap}) : super(key: key);

  final List<Post> posts;
  final Function onItemTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('User ' + posts[index].userId.toString()),
          subtitle: Text(posts[index].title),
          onTap: () => onItemTap(context, posts[index]),
        );
      },
    );
  }
}
