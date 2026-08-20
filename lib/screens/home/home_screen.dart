import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../models/gift.dart';
import '../../models/wishlist.dart';
import '../../widgets/category_chip.dart';
import '../../widgets/gift_card.dart';
import '../../widgets/wishlist_header.dart';
import '../add_gift/add_gift_screen.dart';
import '../gift_details/gift_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedCategory = 0;

  final List<String> categories = [
    'All',
    'Fashion',
    'Tech',
    'Books',
    'Beauty',
  ];

  final List<Gift> gifts = [
    const Gift(
      id: '1',
      name: 'Wireless Headphones',
      category: 'Tech',
      price: 89,
      shop: 'Sound Store',
      imageUrl: '',
      priority: 'High',
      isFavorite: true,
    ),
    const Gift(
      id: '2',
      name: 'Classic Handbag',
      category: 'Fashion',
      price: 120,
      shop: 'Luna Boutique',
      imageUrl: '',
      priority: 'Medium',
      isFavorite: false,
    ),
    const Gift(
      id: '3',
      name: 'The Art Book',
      category: 'Books',
      price: 35,
      shop: 'Book House',
      imageUrl: '',
      priority: 'Low',
      isFavorite: true,
    ),
    const Gift(
      id: '4',
      name: 'Skincare Set',
      category: 'Beauty',
      price: 64,
      shop: 'Glow Shop',
      imageUrl: '',
      priority: 'Medium',
      isFavorite: false,
    ),
  ];

  List<Gift> get filteredGifts {
    if (selectedCategory == 0) {
      return gifts;
    }

    final category = categories[selectedCategory];

    return gifts
        .where((gift) => gift.category == category)
        .toList();
  }

  Wishlist get wishlist {
    return Wishlist(
      title: 'Birthday Wishlist',
      occasion: 'My favorite gift ideas',
      gifts: gifts,
    );
  }

  void toggleFavorite(int index) {
    setState(() {
      final oldGift = gifts[index];

      gifts[index] = Gift(
        id: oldGift.id,
        name: oldGift.name,
        category: oldGift.category,
        price: oldGift.price,
        shop: oldGift.shop,
        imageUrl: oldGift.imageUrl,
        priority: oldGift.priority,
        isFavorite: !oldGift.isFavorite,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                20,
                16,
                20,
                0,
              ),
              sliver: SliverToBoxAdapter(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'My little collection ✨',
                            style: TextStyle(
                              color:
                              AppColors.textSecondary,
                              fontSize: 11,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Wishlist',
                            style: TextStyle(
                              color: AppColors.textDark,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: AppColors.cream,
                        borderRadius:
                        BorderRadius.circular(15),
                      ),
                      child: const Icon(
                        Icons.favorite_border,
                        color: AppColors.darkPink,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                20,
                18,
                20,
                0,
              ),
              sliver: SliverToBoxAdapter(
                child: WishlistHeader(
                  wishlist: wishlist,
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: SizedBox(
                height: 60,
                child: ListView.builder(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 18,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (_, index) {
                    return CategoryChip(
                      label: categories[index],
                      selected:
                      selectedCategory == index,
                      onTap: () {
                        setState(() {
                          selectedCategory = index;
                        });
                      },
                    );
                  },
                ),
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                20,
                8,
                20,
                30,
              ),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    final gift = filteredGifts[index];

                    final originalIndex =
                    gifts.indexWhere(
                          (item) => item.id == gift.id,
                    );

                    return GiftCard(
                      gift: gift,
                      onFavorite: () =>
                          toggleFavorite(originalIndex),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                GiftDetailsScreen(
                                  gift: gift,
                                ),
                          ),
                        );
                      },
                    );
                  },
                  childCount: filteredGifts.length,
                ),
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 14,
                  childAspectRatio: 0.69,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddGiftScreen(),
            ),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('Add Gift'),
      ),
    );
  }
}