import 'package:flutter/material.dart';
import 'package:thinka/core/functions/navigation.dart';
import 'package:thinka/features/home/presentation/widget/ai_action_buttons_widget.dart';

class ResultButtons extends StatelessWidget {
  const ResultButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AiActionButton(
            title: 'Go Back',
            icon: Icons.arrow_back,
            onTap: () => customNavigate(context, '/'),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: AiActionButton(
            title: 'Ask Again',
            icon: Icons.refresh,
            onTap: () {
              // Optionally reset or pop
              customNavigate(context, '/');
            },
          ),
        ),
      ],
    );
  }
}
