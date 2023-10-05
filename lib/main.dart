import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:subspace/data/models/blogs.dart';
import 'package:subspace/presentation/screens/homescreen/homescreen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BlogsAdapter());
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SubSpace',
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue, brightness: Brightness.dark),
        useMaterial3: true,
        brightness: Brightness.dark,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
          ),
        ),
        scaffoldBackgroundColor: Colors.grey.shade900,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
