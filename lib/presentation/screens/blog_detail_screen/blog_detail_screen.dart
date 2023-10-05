import 'package:flutter/material.dart';
import 'package:subspace/presentation/screens/blog_detail_screen/blog_detail_widget/blog_detail_widget.dart';
import 'package:subspace/presentation/screens/global_widgets/appbar.dart';
import 'package:subspace/presentation/screens/global_widgets/drawer.dart';
import 'package:subspace/presentation/screens/global_widgets/subspace_logo.dart';

import '../../../data/models/blogs.dart';
import '../homescreen/homescreen.dart';

class BlogDetailsScreen extends StatelessWidget {
  const BlogDetailsScreen(
      {super.key, required this.blog, required this.internet});

  final Blogs blog;
  final bool internet;

  @override
  Widget build(BuildContext context) {
    return MyAppBar(
        title: const SubSpaceLogo(width: 150),
        bottom: null,
        body: BlogDetailWidget(
          blog: blog,
          internet: internet,
        ),
        drawer: MyDrawer(
          textButton: TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
            child: const Text(
              "Blogs",
            ),
          ),
        ),
        floatingActionButton: null);
  }
}
