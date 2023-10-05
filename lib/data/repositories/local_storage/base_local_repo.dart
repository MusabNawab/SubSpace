
import 'package:hive/hive.dart';
import 'package:subspace/data/models/blogs.dart';

abstract class BaseLocalStorageRepo{
  Future<Box> openBlogBox();
  Future<Box> openFavouriteBlogBox();
  List<Blogs> getLocalBlogs(Box box);
  Future<void> persistBlogs(Box box,Blogs blog);
  Future<void> clearLocalStorage(Box box);
}