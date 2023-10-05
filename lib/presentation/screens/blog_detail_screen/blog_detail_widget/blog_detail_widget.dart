import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:subspace/logic/providers/favourite_blogs.dart';
import 'package:subspace/presentation/constants/constants.dart';
import 'package:subspace/presentation/screens/blog_detail_screen/blog_detail_widget/social_buttons.dart';
import 'package:intl/intl.dart';
import 'package:subspace/presentation/screens/global_widgets/cached_image.dart';
import 'package:subspace/presentation/screens/global_widgets/memory_img.dart';
import 'package:subspace/presentation/screens/global_widgets/snackbar.dart';

import '../../../../data/models/blogs.dart';

class BlogDetailWidget extends ConsumerStatefulWidget {
  const BlogDetailWidget({
    super.key,
    required this.blog,
    required this.internet,
  });

  final Blogs blog;
  final bool internet;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BlogDetailWidgetState();
}

class _BlogDetailWidgetState extends ConsumerState<BlogDetailWidget> {
  int likes = 5;
  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();
    final isFavourite = ref.watch(favouriteBlogProvider).contains(widget.blog);
    void addToFavourites(Blogs blog) {
      ref
          .read(favouriteBlogProvider.notifier)
          .addToFavourite(blog, widget.internet);
    }

    return SingleChildScrollView(
      child: LayoutBuilder(
        builder: (context, constraints) => Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(
              vertical: 60, horizontal: constraints.maxWidth < 600 ? 20 : 50),
          padding: EdgeInsets.symmetric(
              vertical: 40, horizontal: constraints.maxWidth < 600 ? 25 : 50),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.blog.title,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.person),
                ),
                title: const Text(
                  "John Doe",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(DateFormat('MMMM dd,yyyy').format(date)),
                trailing: const SizedBox(
                  width: 80,
                  child: SocialButton(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: constraints.maxWidth < 600 ? 300 : 250,
                width: constraints.maxWidth < 600 ? double.infinity : 600,
                child: Hero(
                  tag: widget.blog.id,
                  child: widget.internet
                      ? CachedImg(
                          networkImg: widget.blog.url,
                          placeholder1: Constants.placeholder1,
                          placeholder2: Constants.placeholder2,
                          height: 250,
                          width: double.infinity)
                      : MyMemoryImage(
                          bytes: widget.blog.url,
                          height: 250,
                          width: double.infinity),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(width: 0.5, color: Colors.grey),
                ),
              ),
              const Text(
                Constants.blogDetails,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                width: 800,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            if (!widget.internet) {
                              MySnackBar.snackBar(
                                  context, 'No internet', Colors.red);
                              return;
                            }
                            addToFavourites(widget.blog);
                            if (!isFavourite) {
                              setState(() {
                                likes++;
                              });
                            }
                            if (isFavourite) {
                              setState(() {
                                likes--;
                              });
                            }
                          },
                          icon: Icon(
                            isFavourite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.red,
                          ),
                        ),
                        Text(
                          likes.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 80,
                      child: SocialButton(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
