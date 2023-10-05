import 'package:riverpod/riverpod.dart';
import 'package:subspace/logic/providers/blog_api_provider.dart';
import '../../data/models/blogs.dart';

//this provider returns the List<Blogs>
final blogProvider = FutureProvider<List<Blogs>>((ref) async {
  return ref.read(blogApiProvider).fetchBlogs(ref);
});