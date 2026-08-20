import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../models/gift.dart';
import '../../widgets/priority_badge.dart';

class GiftDetailsScreen extends StatelessWidget {
  final Gift gift;

  const GiftDetailsScreen({
    super.key,
    required this.gift,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gift Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            height: 230,
            decoration: BoxDecoration(
              color: AppColors.cream,
              borderRadius: BorderRadius.circular(28),
            ),
            child: gift.imageUrl.isEmpty
                ? const Center(
              child: Text(
                '🎁',
                style: TextStyle(fontSize: 90),
              ),
            )
                : ClipRRect(
              borderRadius:
              BorderRadius.circular(28),
              child: Image.network(
                gift.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) {
                  return const Center(
                    child: Text(
                      '🎁',
                      style:
                      TextStyle(fontSize: 90),
                    ),
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 22),

          Row(
            children: [
              Expanded(
                child: Text(
                  gift.name,
                  style: const TextStyle(
                    color: AppColors.textDark,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Icon(
                gift.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: AppColors.pink,
                size: 28,
              ),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              Text(
                '\$${gift.price.toStringAsFixed(0)}',
                style: const TextStyle(
                  color: AppColors.darkPink,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 12),
              PriorityBadge(
                priority: gift.priority,
              ),
            ],
          ),

          const SizedBox(height: 22),

          Container(
            padding: const EdgeInsets.all(17),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: AppColors.border,
              ),
            ),
            child: Column(
              children: [
                _InfoRow(
                  icon: Icons.category_outlined,
                  title: 'Category',
                  value: gift.category,
                ),
                const Divider(
                  height: 25,
                  color: AppColors.border,
                ),
                _InfoRow(
                  icon: Icons.storefront_outlined,
                  title: 'Available at',
                  value: gift.shop,
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          SizedBox(
            height: 52,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_bag_outlined,
              ),
              label: const Text(
                'View Gift',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppColors.pink,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 12,
            ),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}