import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wibshop/components/admin/admin.dart';
import 'package:wibshop/components/cart/cartpage.dart';
import 'package:wibshop/components/guide/guide.dart';
import 'package:wibshop/components/homescreen/home_screen.dart';
import 'package:wibshop/components/account/login.dart';
import 'package:wibshop/components/account/profileAccount.dart';
import 'package:wibshop/components/account/register.dart';
import 'package:wibshop/components/homescreen/splash_screen.dart';
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
