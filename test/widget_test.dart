import 'package:flutter_test/flutter_test.dart';

import 'package:kwatajob/main.dart';

void main() {
  testWidgets('app starts and shows splash screen', (WidgetTester tester) async {
    await tester.pumpWidget(const KwataJobApp()) ;

    expect(find.text('KwataJob'), findsOneWidget);
  });
}
