
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextState {
	final String text;
	final IconData icon;

	TextState({required this.text, required this.icon});
}

class TextCubit extends Cubit<TextState> {
	TextCubit() : super(TextState(text: 'Cat', icon: Icons.pets));

	void toggleText() {
		if (state.text == 'Cat') {
			emit(TextState(text: 'Dog', icon: Icons.person));
		} else {
			emit(TextState(text: 'Cat', icon: Icons.pets));
		}
	}
}
