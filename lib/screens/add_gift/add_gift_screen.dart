import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class AddGiftScreen extends StatefulWidget {
  const AddGiftScreen({super.key});

  @override
  State<AddGiftScreen> createState() =>
      _AddGiftScreenState();
}

class _AddGiftScreenState extends State<AddGiftScreen> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final shopController = TextEditingController();

  String category = 'Fashion';
  String priority = 'Medium';

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    shopController.dispose();
    super.dispose();
  }

  void saveGift() {
    if (nameController.text.trim().isEmpty) {
      return;
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add a Gift',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            height: 130,
            decoration: BoxDecoration(
              color: AppColors.cream,
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Center(
              child: Text(
                '🎀',
                style: TextStyle(fontSize: 55),
              ),
            ),
          ),

          const SizedBox(height: 22),

          const Text(
            'Gift details',
            style: TextStyle(
              color: AppColors.textDark,
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 14),

          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: 'Gift name',
              prefixIcon: Icon(
                Icons.card_giftcard_outlined,
              ),
            ),
          ),

          const SizedBox(height: 12),

          TextField(
            controller: priceController,
            keyboardType:
            const TextInputType.numberWithOptions(
              decimal: true,
            ),
            decoration: const InputDecoration(
              labelText: 'Price',
              prefixText: '\$ ',
              prefixIcon: Icon(
                Icons.attach_money,
              ),
            ),
          ),

          const SizedBox(height: 12),

          TextField(
            controller: shopController,
            decoration: const InputDecoration(
              labelText: 'Shop / Store',
              prefixIcon: Icon(
                Icons.storefront_outlined,
              ),
            ),
          ),

          const SizedBox(height: 20),

          DropdownButtonFormField<String>(
            initialValue: category,
            decoration: const InputDecoration(
              labelText: 'Category',
            ),
            items: [
              'Fashion',
              'Tech',
              'Books',
              'Beauty',
              'Other',
            ].map(
                  (item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              },
            ).toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  category = value;
                });
              }
            },
          ),

          const SizedBox(height: 12),

          DropdownButtonFormField<String>(
            initialValue: priority,
            decoration: const InputDecoration(
              labelText: 'Priority',
            ),
            items: [
              'High',
              'Medium',
              'Low',
            ].map(
                  (item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              },
            ).toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  priority = value;
                });
              }
            },
          ),

          const SizedBox(height: 25),

          SizedBox(
            height: 52,
            child: ElevatedButton.icon(
              onPressed: saveGift,
              icon: const Icon(
                Icons.favorite_border,
              ),
              label: const Text(
                'Save to Wishlist',
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