import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salesman_tracking/components/bottom_navigation.dart';
import 'package:salesman_tracking/features/Account/account_page.dart';
import 'package:salesman_tracking/features/Chat/chat_page.dart';
import 'package:salesman_tracking/features/Chat/message_page.dart';
import 'package:salesman_tracking/features/Home/home_page.dart';
import 'package:salesman_tracking/features/Track/track_page.dart';

final _router = GoRouter(
  initialLocation: "/home",
  routes: [
    ShellRoute(
      builder: (context, state, child) => BottomNavigation(
        child: child,
        currentLocation: state.uri.toString(), // Pass current URI
      ),
      routes: [
        GoRoute(path: "/home", builder: (context, state) => const HomePage()),
        GoRoute(path: "/track", builder: (context, state) => const TrackPage()),
        GoRoute(path: "/chat", builder: (context, state) => const ChatPage()),
        GoRoute(path: "/message", builder: (context, state) => const MessagePage()),
        GoRoute(path: "/account", builder: (context, state) => const AccountPage()),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Salesman Tracking",
      theme: ThemeData(useMaterial3: true),
      routerConfig: _router,
    );
  }
}
