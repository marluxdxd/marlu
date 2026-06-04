import 'package:flutter_test/flutter_test.dart';

import 'package:portfolio_web/main.dart';

void main() {
  testWidgets('Portfolio renders key content', (WidgetTester tester) async {
    await tester.pumpWidget(const PortfolioApp());

    expect(find.text('Marlu A. Enriquez'), findsOneWidget);
    expect(find.text('HoMa POS'), findsOneWidget);
    expect(find.text('Flutter'), findsWidgets);
  });
}
