import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/blogs.dart';

class FavouriteBlogNotifier extends StateNotifier<List<Blogs>> {
  FavouriteBlogNotifier() : super([]);

  void addToFavourite(Blogs blog, bool internet) async {
    //check if the blog is favourite
    final isFavourite = state.contains(blog);
    //if yes then remove it from list 
    if (isFavourite) {
      state = state.where((element) => element.id != blog.id).toList();
    } 
    //else add it into the list
    else {
      state = [...state, blog];
    }
  }
}

//returns the List<Blogs> the are marked favourite
final favouriteBlogProvider =
    StateNotifierProvider<FavouriteBlogNotifier, List<Blogs>>(
        (ref) => FavouriteBlogNotifier());
