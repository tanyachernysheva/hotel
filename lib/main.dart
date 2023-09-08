import 'package:flutter/material.dart';
import 'package:hotel/navigation/app_router.dart';
import 'package:hotel/shared/theme_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: ThemeConfig.themeData,
    );
  }
}
