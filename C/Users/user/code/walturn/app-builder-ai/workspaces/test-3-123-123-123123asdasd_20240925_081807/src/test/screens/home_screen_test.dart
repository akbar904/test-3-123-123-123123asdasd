
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';

import 'package:com.example.simple_text_toggle/screens/home_screen.dart';

// Mock for TextCubit
class MockTextCubit extends MockCubit<TextState> implements TextCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		late TextCubit textCubit;

		setUp(() {
			textCubit = MockTextCubit();
		});

		testWidgets('displays "Cat" with clock icon initially', (WidgetTester tester) async {
			when(() => textCubit.state).thenReturn(TextState(text: 'Cat', icon: Icons.access_time));

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<TextCubit>(
						create: (_) => textCubit,
						child: HomeScreen(),
					),
				),
			);

			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('displays "Dog" with person icon after toggle', (WidgetTester tester) async {
			when(() => textCubit.state).thenReturn(TextState(text: 'Dog', icon: Icons.person));

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<TextCubit>(
						create: (_) => textCubit,
						child: HomeScreen(),
					),
				),
			);

			final textFinder = find.text('Dog');
			final iconFinder = find.byIcon(Icons.person);

			expect(textFinder, findsOneWidget);
			expect(iconFinder, findsOneWidget);
		});

		testWidgets('taps on text toggles text and icon', (WidgetTester tester) async {
			whenListen(
				textCubit,
				Stream.fromIterable([
					TextState(text: 'Cat', icon: Icons.access_time),
					TextState(text: 'Dog', icon: Icons.person),
				]),
				initialState: TextState(text: 'Cat', icon: Icons.access_time),
			);

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<TextCubit>(
						create: (_) => textCubit,
						child: HomeScreen(),
					),
				),
			);

			final textFinder = find.text('Cat');

			await tester.tap(textFinder);
			await tester.pump();

			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}
