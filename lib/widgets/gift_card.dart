import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../models/gift.dart';
import 'priority_badge.dart';

class GiftCard extends StatelessWidget {
  final Gift gift;
  final VoidCallback onFavorite;
  final VoidCallback onTap;

  const GiftCard({
    super.key,
    required this.gift,
    required this.onFavorite,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: AppColors.border,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.rose.withValues(alpha: 0.35),
              blurRadius: 14,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 135,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.cream,
                    borderRadius:
                    const BorderRadius.vertical(
                      top: Radius.circular(22),
                    ),
                  ),
                  child: gift.imageUrl.isEmpty
                      ? const Center(
                    child: Text(
                      '🎁',
                      style: TextStyle(
                        fontSize: 48,
                      ),
                    ),
                  )
                      : ClipRRect(
                    borderRadius:
                    const BorderRadius.vertical(
                      top: Radius.circular(22),
                    ),
                    child: Image.network(
                      gift.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder:
                          (_, __, ___) {
                        return const Center(
                          child: Text(
                            '🎁',
                            style: TextStyle(
                              fontSize: 48,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: onFavorite,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black
                                .withValues(alpha: 0.08),
                            blurRadius: 7,
                          ),
                        ],
                      ),
                      child: Icon(
                        gift.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        size: 18,
                        color: gift.isFavorite
                            ? AppColors.pink
                            : AppColors.textSecondary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(13),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    gift.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.textDark,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    gift.shop,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        '\$${gift.price.toStringAsFixed(0)}',
                        style: const TextStyle(
                          color: AppColors.darkPink,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      PriorityBadge(
                        priority: gift.priority,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}