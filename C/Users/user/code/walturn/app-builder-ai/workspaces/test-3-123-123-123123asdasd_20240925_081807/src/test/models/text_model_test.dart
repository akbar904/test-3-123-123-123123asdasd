
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.simple_text_toggle/models/text_model.dart';

void main() {
	group('TextModel', () {
		test('should correctly serialize to JSON', () {
			final textModel = TextModel(text: 'Cat', icon: Icons.pets);
			final json = textModel.toJson();

			expect(json, {
				'text': 'Cat',
				'icon': Icons.pets.codePoint,
			});
		});

		test('should correctly deserialize from JSON', () {
			final json = {
				'text': 'Dog',
				'icon': Icons.person.codePoint,
			};
			final textModel = TextModel.fromJson(json);

			expect(textModel.text, 'Dog');
			expect(textModel.icon, Icons.person);
		});
	});
}
