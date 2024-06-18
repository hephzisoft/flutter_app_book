import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../home/view/home_screen.dart';
import '../controller/tab_controller.dart';

class TabScreen extends ConsumerWidget {
  const TabScreen({super.key});

  final pages = const [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var index = ref.watch(tabControllerProvider);
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (value) {
          ref.watch(tabControllerProvider.notifier).changeIndex(value);
        },
        destinations: const [
          NavigationDestination(
            label: '',
            icon: Icon(Icons.home),
          ),
          NavigationDestination(
            label: '',
            icon: Icon(Icons.search),
          ),
          NavigationDestination(
            label: '',
            icon: Icon(Icons.book),
          ),
        ],
      ),
    );
  }

}



