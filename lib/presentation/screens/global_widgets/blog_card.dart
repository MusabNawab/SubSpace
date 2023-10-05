import 'package:flutter/material.dart';

import '../../../data/models/blogs.dart';
import '../../constants/constants.dart';
import '../blog_detail_screen/blog_detail_screen.dart';
import 'cached_image.dart';
import 'memory_img.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({super.key, required this.internet, required this.blog});

  final bool internet;
  final Blogs blog;
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return BlogDetailsScreen(
                              blog: blog, internet: internet);
                        },
                      ),
                    );
                  },
                  child: Card(
                    clipBehavior: Clip.hardEdge,
                    color: Colors.transparent,
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                            tag: blog.id,
                            child: internet
                                ? CachedImg(
                                    networkImg: blog.url,
                                    placeholder1: Constants.placeholder1,
                                    placeholder2: Constants.placeholder2,
                                    height: 200,
                                    width: double.infinity,
                                  )
                                : MyMemoryImage(
                                    bytes: blog.url,
                                    height: 200,
                                    width: double.infinity)),
                        Container(
                          padding: const EdgeInsets.only(top: 20, left: 15),
                          height: 50,
                          child: Text(
                            blog.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
  }
}