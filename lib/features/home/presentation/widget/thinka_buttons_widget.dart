import 'package:flutter/material.dart';
import 'package:thinka/features/home/presentation/widget/ai_action_buttons_widget.dart';

class ThinkaButtonsWidget extends StatelessWidget {
  const ThinkaButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AiActionButton(title: 'Explain', icon: Icons.lightbulb, onTap: () {}),
        AiActionButton(
          title: 'Summarize',
          icon: Icons.description,
          onTap: () {},
        ),
        AiActionButton(title: 'Quiz Me', icon: Icons.quiz, onTap: () {}),
      ],
    );
  }
}
