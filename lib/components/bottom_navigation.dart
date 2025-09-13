import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class BottomNavigation extends StatelessWidget {
  final Widget child;
  const BottomNavigation({super.key, required this.child});

  static final tabs = [
    "/home",
    "/track",
    "/chat",
    "/account",
  ];

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final currentIndex = tabs.indexWhere((t) => location.startsWith(t));

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        height: 70,
        selectedIndex: currentIndex < 0 ? 0 : currentIndex,
        onDestinationSelected: (index) {
          context.go(tabs[index]);
        },
        destinations: const [
          NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
          NavigationDestination(icon: Icon(Iconsax.gps), label: "Track"),
          NavigationDestination(icon: Icon(Iconsax.message), label: "Chat"),
          NavigationDestination(icon: Icon(Iconsax.user), label: "Account"),
        ],
      ),
    );
  }
}
