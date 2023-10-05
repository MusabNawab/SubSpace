import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:subspace/logic/providers/connectivity_provider.dart';
import 'package:subspace/logic/providers/favourite_blogs.dart';
import 'package:subspace/presentation/screens/global_widgets/appbar.dart';
import 'package:subspace/presentation/screens/global_widgets/subspace_logo.dart';
import 'package:subspace/presentation/screens/homescreen/homescreen.dart';
import 'package:subspace/presentation/screens/global_widgets/bloglist.dart';
import 'package:subspace/presentation/screens/global_widgets/drawer.dart';
import 'package:subspace/presentation/screens/homescreen/widget/no_internet.dart';
import '../../../data/models/blogs.dart';

class FavouritesScreen extends ConsumerWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Blogs> favourites = ref.watch(favouriteBlogProvider);
    final internet = ref.read(connectivityProvider);
    const title = SubSpaceLogo(width: 150);

    final body = !internet
        ? const NoInternetWidget()
        : favourites.isEmpty
            ? const Center(
                child: Text("No Favourites"),
              )
            : BlogList(
                blogs: favourites,
                internet: internet,
                favouriteScreen: true,
              );
    return MyAppBar(
        title: title,
        bottom: null,
        body: body,
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
