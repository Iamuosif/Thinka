import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thinka/features/home/cubit/ai_cubit.dart';

import 'package:thinka/features/home/presentation/widget/ai_action_buttons_widget.dart';

class ThinkaButtonsWidget extends StatelessWidget {
  final TextEditingController controller;
  const ThinkaButtonsWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AiActionButton(
          title: 'Explain',
          icon: Icons.lightbulb,
          onTap: () {
            context.read<AiCubit>().sendRequest(controller.text, "explain");
          },
        ),
        AiActionButton(
          title: 'Summarize',
          icon: Icons.description,
          onTap: () {
            context.read<AiCubit>().sendRequest(controller.text, "summarize");
          },
        ),
        AiActionButton(
          title: 'Quiz Me',
          icon: Icons.quiz,
          onTap: () {
            context.read<AiCubit>().sendRequest(controller.text, "quiz");
          },
        ),
      ],
    );
  }
}
