
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.example.simple_text_toggle/cubits/text_cubit.dart';
import 'package:com.example.simple_text_toggle/widgets/text_toggle_widget.dart';

class HomeScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Simple Text Toggle'),
			),
			body: Center(
				child: BlocBuilder<TextCubit, TextState>(
					builder: (context, state) {
						return GestureDetector(
							onTap: () => context.read<TextCubit>().toggleText(),
							child: TextToggleWidget(text: state.text, icon: state.icon),
						);
					},
				),
			),
		);
	}
}
