import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wibshop/components/screens/admin.dart';
import 'package:wibshop/components/screens/cartpage.dart';
import 'package:wibshop/components/screens/guide.dart';
import 'package:wibshop/components/screens/home_screen.dart';
import 'package:wibshop/components/screens/login.dart';
import 'package:wibshop/components/screens/profileAccount.dart';
import 'package:wibshop/components/screens/register.dart';
import 'package:wibshop/components/screens/splash_screen.dart';
import 'package:wibshop/utils/theme/theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TMyAppTheme.lightTheme,
      darkTheme: TMyAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/home': (context) => const HomeScreen(),
        '/cart': (context) => const CartPage(),
        '/guide': (context) => const GuideScreen(),
        '/profile': (context) => const Profileaccount(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/admin': (context) => const AdminScreen(),
      },
      home: const SplashScreen(),
    );
  }
}
