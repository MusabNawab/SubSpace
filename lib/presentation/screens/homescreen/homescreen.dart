import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:subspace/data/models/blogs.dart';
import 'package:subspace/logic/providers/blog_list_provider.dart';
import 'package:subspace/presentation/constants/constants.dart';
import 'package:subspace/presentation/screens/favourites_screen.dart/favourites_screen.dart';
import 'package:subspace/presentation/screens/global_widgets/appbar.dart';
import 'package:subspace/presentation/screens/global_widgets/snackbar.dart';
import 'package:subspace/presentation/screens/global_widgets/subspace_logo.dart';
import 'package:subspace/presentation/screens/homescreen/widget/blog_skeleton.dart';
import 'package:subspace/presentation/screens/homescreen/widget/no_internet.dart';
import 'package:subspace/presentation/screens/homescreen/widget/tab_widget.dart';
import '../../../logic/providers/connectivity_provider.dart';
import '../global_widgets/bloglist.dart';
import '../global_widgets/drawer.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool appLoaded = false;

  @override
  void initState() {
    _tabController = TabController(length: 14, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AsyncValue<List<Blogs>> blogs = ref.watch(blogProvider);
    bool internetConnection = ref.read(connectivityProvider);

    ref.listen(connectivityProvider, (_, isConnected) async {
      if (!appLoaded) {
        appLoaded = true;
        return;
      } else {
        if (!isConnected && appLoaded) {
          MySnackBar.snackBar(context, 'No Internet', Colors.red);
        }
        if (isConnected && appLoaded) {
          MySnackBar.snackBar(context, 'Online', Colors.green);
        }
      }
    });

    final PreferredSize bottom = PreferredSize(
      preferredSize: const Size(double.infinity, 100),
      child: TabBar(
        controller: _tabController,
        isScrollable: true,
        labelColor: Colors.white,
        labelStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        indicatorColor: Colors.transparent,
        dividerColor: Colors.transparent,
        tabs: List.generate(
          Constants.tabs.length,
          (index) => TabWidet(title: Constants.tabs[index], height: 100),
        ),
      ),
    );

    final Widget body = blogs.when(
        data: (data) {
          if (data.isEmpty) {
            return const NoInternetWidget();
          }
          return TabBarView(
            controller: _tabController,
            children: List.generate(
              Constants.tabs.length,
              (index) => BlogList(
                internet: internetConnection,
                blogs: data,
                favouriteScreen: false,
              ),
            ),
          );
        },
        error: (error, stackTrace) => const Center(
              child: Text("Something went wrong"),
            ),
        loading: () => const BlogSkeleton());

    final Widget floatingActionButton = FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.chat),
    );

    return MyAppBar(
        title: const SubSpaceLogo(width: 150),
        bottom: bottom,
        body: body,
        drawer: MyDrawer(
          textButton: TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const FavouritesScreen(),
                ),
              );
            },
            child: const Text(
              "Favourites",
            ),
          ),
        ),
        floatingActionButton: floatingActionButton);
  }
}
