import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../models/wishlist.dart';

class WishlistHeader extends StatelessWidget {
  final Wishlist wishlist;

  const WishlistHeader({
    super.key,
    required this.wishlist,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppColors.cream,
            Color(0xFFFFE0E8),
          ],
        ),
        borderRadius: BorderRadius.circular(26),
      ),
      child: Row(
        children: [
          Container(
            width: 62,
            height: 62,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(
              child: Text(
                '🎁',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  wishlist.title,
                  style: const TextStyle(
                    color: AppColors.textDark,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  wishlist.occasion,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 9),
                Text(
                  '${wishlist.itemCount} gifts • \$${wishlist.totalValue.toStringAsFixed(0)} total',
                  style: const TextStyle(
                    color: AppColors.darkPink,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}