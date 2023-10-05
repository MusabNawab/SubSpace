import 'package:hive/hive.dart';
import 'package:subspace/data/models/blogs.dart';
import 'package:subspace/data/repositories/local_storage/base_local_repo.dart';

class LocalStorageRepo extends BaseLocalStorageRepo {
  String boxName = 'subspace';
  String favouriteBox = 'favouriteBlogs';

  @override
  Future<Box> openBlogBox() async {
    Box box = await Hive.openBox<Blogs>(boxName);
    return box;
  }

  @override
  Future<Box> openFavouriteBlogBox() async {
    Box box = await Hive.openBox<Blogs>(favouriteBox);
    return box;
  }

  @override
  List<Blogs> getLocalBlogs(Box box) {
    return box.values.toList() as List<Blogs>;
  }

  @override
  Future<void> persistBlogs(Box box, Blogs blog) async {
    await box.add(blog);
  }

  @override
  Future<void> clearLocalStorage(Box box) async {
    await box.clear();
  }
}
