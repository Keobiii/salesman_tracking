import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class BottomNavigation extends StatelessWidget {
  final Widget child;
  final String currentLocation;

  const BottomNavigation({
    super.key,
    required this.child,
    required this.currentLocation,
  });

  static final tabs = [
    "/home",
    "/track",
    "/chat",
    "/account",
  ];

  @override
  Widget build(BuildContext context) {
    final uri = Uri.parse(currentLocation);
    final pathSegment = '/${uri.pathSegments.isNotEmpty ? uri.pathSegments[0] : ''}';
    final currentIndex = tabs.indexOf(pathSegment);
    final selectedIndex = currentIndex < 0 ? 0 : currentIndex;

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: Colors.white,
          indicatorColor: Colors.transparent,
          iconTheme: WidgetStateProperty.resolveWith((states) {
            return IconThemeData(
              color: states.contains(WidgetState.selected) ? Colors.black : Colors.grey,
            );
          }),
          labelTextStyle: WidgetStateProperty.resolveWith((states) {
            return TextStyle(
              color: states.contains(WidgetState.selected) ? Colors.black : Colors.grey,
              fontWeight: states.contains(WidgetState.selected) ? FontWeight.bold : FontWeight.normal,
            );
          }),
          overlayColor: WidgetStateProperty.resolveWith((states) => Colors.transparent), 
        ),
        child: NavigationBar(
          height: 70,
          selectedIndex: selectedIndex,
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
      ),
    );
  }

}
