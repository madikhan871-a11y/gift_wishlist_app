import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'screens/home/home_screen.dart';

void main() {
  runApp(const GiftWishlistApp());
}

class GiftWishlistApp extends StatelessWidget {
  const GiftWishlistApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gift Wishlist',
      theme: AppTheme.theme,
      home: const HomeScreen(),
    );
  }
}