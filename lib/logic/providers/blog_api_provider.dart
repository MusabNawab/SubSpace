import 'dart:convert';
import 'package:riverpod/riverpod.dart';
import 'package:subspace/data/models/blogs.dart';
import 'package:http/http.dart' as http;
import 'package:subspace/data/repositories/local_storage/local_storage_repo.dart';
import 'package:subspace/logic/providers/connectivity_provider.dart';
import 'package:subspace/presentation/constants/constants.dart';

class CallBlogApi {
  Future<List<Blogs>> fetchBlogs(Ref ref) async {
    const String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';

    const String adminSecret =
        '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

    List<Blogs> blogsList = []; //will contain all blogs from api

    final localRepo = LocalStorageRepo(); //instance of Hive helper class
    
    final box = await localRepo.openBlogBox(); // opening hive box

    final internet = ref.watch(connectivityProvider);

    //if there is internet the only send request (will also take care of SocketException)
    if (internet) {

      //sending Http GET request
      final response = await http.get(Uri.parse(url), headers: {
        'x-hasura-admin-secret': adminSecret,
      });

      final responseBody = json.decode(response.body);

      //Extracting List of blogs from json (response body format: {'blogs':[]})
      final List blogsJson = responseBody["blogs"];

      //mapping json to blogs object (deserialization)
      blogsList = blogsJson.map((e) => Blogs.fromMap(e)).toList();

      //clearing previous blogs if stored in local storage
      await localRepo.clearLocalStorage(box);

      //extracting latest 10 blogs and storing them in local storage
      for (int i = blogsList.length - 10; i <= blogsList.length; i++) {

        //converting image to base64 string to display in offline mode
        final imgBytes = await Constants.convertImgToBase64(blogsList[i].url);
        
        //adding base64 img in the object
        Blogs temp = Blogs(
            id: blogsList[i].id, title: blogsList[i].title, url: imgBytes);
        
        //saving the object
        await localRepo.persistBlogs(box, temp);
      }
    }

    if (!internet) {
      //no internet, display stored blogs
      blogsList = LocalStorageRepo().getLocalBlogs(box);
    }
    
    //dispose box once finished
    await box.close();
    return blogsList;
  }
}

final blogApiProvider = Provider<CallBlogApi>((ref) => CallBlogApi());
