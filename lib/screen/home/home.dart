import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hse_expo_check/provider/nav_bar_provider.dart';
import 'package:hse_expo_check/screen/home/home_screen.dart';
import 'package:hse_expo_check/widgets/floating_button.dart';

class NavHome extends ConsumerWidget {
  const NavHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int selectedIndex = ref.watch(navBarProvider);
    Widget mainScreen = Container();
    if (selectedIndex == 0) {
      mainScreen = const HomeScreen();
    } else if (selectedIndex == 1) {
      // mainScreen = const Booking();
    }

    return Scaffold(
      body: mainScreen,
      floatingActionButton: const FloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 15.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.home_outlined,
                size: 30,
              ),
              color: selectedIndex == 0 ? const Color(0xff0E8C87) : Colors.grey,
              onPressed: () => ref.read(navBarProvider.notifier).updateIndex(0),
            ),
            const SizedBox(width: 20),
            // Adjust the spacing as needed
            IconButton(
              icon: const Icon(Icons.logout),
              color: selectedIndex == 2 ? const Color(0xff0E8C87) : Colors.grey,
              onPressed: () => ref.read(navBarProvider.notifier).updateIndex(1),
            ),
          ],
        ),
      ),
    );
  }
}
