import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:subspace/logic/providers/blog_list_provider.dart';
import 'package:subspace/presentation/screens/global_widgets/blog_card.dart';
import '../../../data/models/blogs.dart';

class BlogList extends ConsumerWidget {
  const BlogList({
    super.key,
    required this.blogs,
    required this.internet,
    required this.favouriteScreen,
  });

  final List<Blogs> blogs;
  final bool internet;
  final bool favouriteScreen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () async {
        if (favouriteScreen) {
          return;
        }
        return await ref.refresh(blogProvider);
      },
      child: LayoutBuilder(
        builder: (context, constraints) => Column(
          children: [
            !internet
                ? const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.signal_wifi_connected_no_internet_4_outlined,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Offline mode",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                : const SizedBox(),
            constraints.maxWidth < 600
                ? Expanded(
                    child: ListView.builder(
                      itemCount: blogs.length,
                      itemBuilder: (context, index) {
                        return BlogCard(internet: internet, blog: blogs[index]);
                      },
                    ),
                  )
                : Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,childAspectRatio: 4/3,crossAxisSpacing: 0,mainAxisSpacing: 0),
                        itemCount: blogs.length,
                        itemBuilder: (context, index) {
                          return BlogCard(internet: internet, blog: blogs[index]);
                        },
                      ),
                  ),
                )
          ],
        ),
      ),
    );
  }
}
