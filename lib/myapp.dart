import 'package:flutter/material.dart';
import 'package:salesman_tracking/core/router/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Salesman Tracking",
      theme: ThemeData(useMaterial3: true),
      routerConfig: appRouter,
    );
  }
}