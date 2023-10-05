import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key, required this.textButton});
  final Widget textButton;
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Drawer(
        child: Column(
          children: [
            AppBar(
              title: Image.asset(
                "assets/images/subspace.png",
                width: 150,
              ),
              actions: [
                IconButton(
                    onPressed: Navigator.of(context).pop,
                    icon: const Icon(Icons.close))
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            FadeTransition(
              opacity: _animationController,
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "SuperFlow",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  widget.textButton,
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    child: const Text("Subspace Web"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
