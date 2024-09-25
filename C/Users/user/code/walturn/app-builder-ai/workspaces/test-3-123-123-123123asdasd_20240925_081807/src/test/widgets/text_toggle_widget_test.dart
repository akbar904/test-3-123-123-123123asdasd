
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.simple_text_toggle/widgets/text_toggle_widget.dart';

// Mocking the TextCubit
class MockTextCubit extends MockCubit<TextState> implements TextCubit {}

void main() {
	group('TextToggleWidget', () {
		late TextCubit textCubit;

		setUp(() {
			textCubit = MockTextCubit();
		});

		testWidgets('displays initial text and icon', (WidgetTester tester) async {
			when(() => textCubit.state).thenReturn(TextState(text: 'Cat', icon: Icons.access_time));

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider.value(
						value: textCubit,
						child: TextToggleWidget(),
					),
				),
			);

			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('toggles text and icon on tap', (WidgetTester tester) async {
			whenListen(textCubit, Stream.fromIterable([
				TextState(text: 'Cat', icon: Icons.access_time),
				TextState(text: 'Dog', icon: Icons.person),
			]), initialState: TextState(text: 'Cat', icon: Icons.access_time));

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider.value(
						value: textCubit,
						child: TextToggleWidget(),
					),
				),
			);

			await tester.tap(find.text('Cat'));
			await tester.pump();

			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}
