import 'package:flutter_test/flutter_test.dart';

import 'package:gift_wishlist_app/main.dart';

void main() {
  testWidgets(
    'Gift wishlist app loads',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const GiftWishlistApp(),
      );

      expect(
        find.text('Wishlist'),
        findsOneWidget,
      );
    },
  );
}