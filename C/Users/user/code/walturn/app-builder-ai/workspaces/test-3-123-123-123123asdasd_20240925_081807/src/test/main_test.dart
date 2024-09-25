
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_text_toggle/main.dart';

void main() {
	group('MyApp', () {
		testWidgets('renders HomeScreen', (WidgetTester tester) async {
			// Build our app and trigger a frame.
			await tester.pumpWidget(MyApp());

			// Verify that HomeScreen is displayed.
			expect(find.byType(HomeScreen), findsOneWidget);
		});
	});
}
