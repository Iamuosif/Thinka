import 'package:flutter/material.dart';
import 'package:thinka/core/routes/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(scaffoldBackgroundColor: Colors.grey[200]),
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
