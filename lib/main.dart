import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/home_page.dart';
import 'screens/item_detail_page.dart';
import 'screens/chat_page.dart';
import 'screens/wishlist_page.dart';
import 'screens/cart_page.dart';
import 'screens/packages_page.dart';
import 'screens/order_monitoring_page.dart';
import 'screens/returns_page.dart';
import 'screens/navigation_page.dart';
import 'screens/profile_page.dart';
import 'screens/checkout_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camp Gear Rental',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF3E2723), // Dark Brown
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFF8D6E63), // Light Brown
          secondary: const Color(0xFFD7CCC8), // Beige
          surface: const Color(0xFF212121), // Dark Gray
          background: Colors.black,
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onSurface: Colors.white,
          onBackground: Colors.white,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(color: Colors.white),
          displayMedium: TextStyle(color: Colors.white),
          displaySmall: TextStyle(color: Colors.white),
          headlineMedium: TextStyle(color: Colors.white),
          headlineSmall: TextStyle(color: Colors.white),
          titleLarge: TextStyle(color: Colors.white),
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF3E2723), // Dark Brown
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF8D6E63), // Light Brown
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        cardTheme: CardTheme(
          color: const Color(0xFF212121), // Dark Gray
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
        ),
      ),
      home: const NavigationPage(),
      routes: {
        '/page1': (context) => const HomePage(),
        '/page2': (context) => const ItemDetailPage(),
        '/page3': (context) => const ChatPage(),
        '/page4': (context) => const WishlistPage(),
        '/page5': (context) => const CartPage(),
        '/page6': (context) => const PackagesPage(),
        '/transaction1': (context) => const OrderMonitoringPage(),
        '/transaction2': (context) => const ReturnsPage(),
        '/profile': (context) => const ProfilePage(),
        '/checkout': (context) => const CheckoutPage(),
      },
    );
  }
}