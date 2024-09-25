
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.simple_text_toggle/cubits/text_cubit.dart';

// Mock class for TextCubit
class MockTextCubit extends MockCubit<TextState> implements TextCubit {}

void main() {
	group('TextCubit', () {
		late TextCubit textCubit;

		setUp(() {
			textCubit = TextCubit();
		});

		tearDown(() {
			textCubit.close();
		});

		test('initial state is TextState with text "Cat" and cat icon', () {
			expect(textCubit.state.text, 'Cat');
			expect(textCubit.state.icon, Icons.pets); // Assuming Icons.pets is the cat icon.
		});

		blocTest<TextCubit, TextState>(
			'emits [TextState(text: "Dog", icon: Icons.person)] when toggleText is called from initial state',
			build: () => textCubit,
			act: (cubit) => cubit.toggleText(),
			expect: () => [
				TextState(text: 'Dog', icon: Icons.person),
			],
		);

		blocTest<TextCubit, TextState>(
			'emits [TextState(text: "Cat", icon: Icons.pets)] when toggleText is called from Dog state',
			build: () => textCubit,
			seed: () => TextState(text: 'Dog', icon: Icons.person),
			act: (cubit) => cubit.toggleText(),
			expect: () => [
				TextState(text: 'Cat', icon: Icons.pets),
			],
		);
	});
}
