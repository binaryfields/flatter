import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../model/post.dart';
import '../util/error.dart';

class PostService {
  PostService({
    @required this.client
  });

  final String baseUrl = 'https://jsonplaceholder.typicode.com';
  final http.Client client;

  bool retry = true;

  Future<List<Post>> fetch() async {
    retry = !retry;
    if (retry) {
      await Future.delayed(Duration(seconds: 2));
      throw ServerException('Internal server error');
    } else {
      final response = await client.get('$baseUrl/posts');
      if (response.statusCode == 200) {
        return _parsePosts(response.body);
      } else {
        throw mapHttpError(response);
      }
    }
  }
}

List<Post> _parsePosts(String json) {
  final data = jsonDecode(json).cast<Map<String, dynamic>>();
  return data.map<Post>((item) => Post.fromJson(item)).toList();
}
