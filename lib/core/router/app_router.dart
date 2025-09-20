import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salesman_tracking/presentation/auth/login_page.dart';
import 'package:salesman_tracking/presentation/auth/register_page.dart';

import 'package:salesman_tracking/presentation/components/bottom_navigation.dart';
import 'package:salesman_tracking/presentation/account/account_page.dart';
import 'package:salesman_tracking/presentation/chat/chat_page.dart';
import 'package:salesman_tracking/presentation/chat/message_page.dart';
import 'package:salesman_tracking/presentation/home/home_page.dart';
import 'package:salesman_tracking/presentation/Track/track_page.dart';

final appRouter = GoRouter(
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
        GoRoute(path: "/login", builder: (context, state) => const LoginPage()),
        GoRoute(path: "/register", builder: (context, state) => const RegisterPage()),
      ],
    ),
  ],
);
