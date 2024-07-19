import 'package:dio/dio.dart';
import 'package:flatter/model/post.dart';

class PostService {
  final Dio dio;

  const PostService({required this.dio});

  Future<List<Post>> fetch() async {
    final response = await dio.get(
      '/posts',
    );
    final List<dynamic> data = response.data;
    return data.map((item) => Post.fromJson(item)).toList();
  }
}
