import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:subspace/data/dummy_data/dummy_data.dart';
import 'package:subspace/data/models/blogs.dart';
import 'package:subspace/presentation/constants/constants.dart';

class BlogSkeleton extends StatelessWidget {
  const BlogSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final blogs = DummyData.dummyData.map((e) => Blogs.fromMap(e)).toList();
    return Skeletonizer(
      child: ListView.builder(
        itemCount: blogs.length,
        itemBuilder: (context, index) {
          return Card(
            clipBehavior: Clip.hardEdge,
            color: Colors.transparent,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  Constants.placeholder1,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20, left: 15),
                  height: 50,
                  child: Text(
                    blogs[index].title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
