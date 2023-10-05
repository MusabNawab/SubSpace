import 'dart:convert';
import 'package:http/http.dart' as http;

class Constants {
  static List tabs = [
    "All",
    "Merchants",
    "Business",
    "Tutorial",
    "World",
    "Subspace",
    "Superflow",
    "Announcements",
    "Subscription",
    "OTT",
    "Students",
    "General Users",
    "Entertainment",
    "Finance",
  ];

  static Future<String> convertImgToBase64(String url) async {
    try {
      final imageResponse = await http.get(Uri.parse(url));
      final imgBytes = base64Encode(imageResponse.bodyBytes);
      return imgBytes;
    } catch (e) {
      return '';
    }
  }

  static const String subspaceLogo = "assets/images/subspace.png";
  static const String placeholder1 = "assets/images/placeholder-1.png";
  static const String placeholder2 = "assets/images/placeholder-2.png";
  static const String noInternet = "assets/images/no_internet-2.json";
  static const String error = "assets/images/error.json";
  static const String facebook = "assets/images/facebook.png";
  static const String twitter = "assets/images/twitter.png";
  static const String linkedin = "assets/images/linkedin.png";

  static const String blogDetails =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Purus gravida quis blandit turpis cursus. Turpis nunc eget lorem dolor sed. Ullamcorper malesuada proin libero nunc consequat interdum varius. Orci nulla pellentesque dignissim enim. Sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus. Consequat nisl vel pretium lectus. Est ullamcorper eget nulla facilisi etiam. Habitant morbi tristique senectus et netus et malesuada. Quis vel eros donec ac odio tempor orci. Ac feugiat sed lectus vestibulum mattis ullamcorper velit. Maecenas pharetra convallis posuere morbi leo urna. Volutpat consequat mauris nunc congue nisi vitae suscipit tellus mauris. Ultrices in iaculis nunc sed augue lacus viverra vitae. Enim sit amet venenatis urna cursus. Mauris in aliquam sem fringilla ut morbi. Eget mi proin sed libero enim. Commodo sed egestas egestas fringilla. Tellus pellentesque eu tincidunt tortor aliquam nulla. Arcu dui vivamus arcu felis.\nLacus viverra vitae congue eu consequat ac. Non blandit massa enim nec dui. Ac tincidunt vitae semper quis lectus nulla at volutpat diam. Et odio pellentesque diam volutpat commodo sed egestas egestas. Suscipit adipiscing bibendum est ultricies integer. Porttitor eget dolor morbi non arcu risus quis. Nibh sit amet commodo nulla facilisi nullam vehicula. Donec et odio pellentesque diam volutpat commodo sed egestas egestas. Id leo in vitae turpis massa sed elementum tempus. Ultrices neque ornare aenean euismod elementum nisi. Donec pretium vulputate sapien nec sagittis aliquam.\nIn metus vulputate eu scelerisque felis imperdiet proin fermentum. Accumsan lacus vel facilisis volutpat est. Et malesuada fames ac turpis. Porta non pulvinar neque laoreet suspendisse interdum consectetur libero id. Arcu cursus vitae congue mauris rhoncus aenean vel elit scelerisque. Ultrices sagittis orci a scelerisque purus semper. Adipiscing elit ut aliquam purus sit amet luctus venenatis lectus. Ultricies mi quis hendrerit dolor magna eget est. Donec et odio pellentesque diam volutpat commodo. Proin libero nunc consequat interdum varius sit amet mattis. Ac tortor dignissim convallis aenean et tortor at risus viverra. Leo in vitae turpis massa sed elementum tempus egestas sed.";
}
