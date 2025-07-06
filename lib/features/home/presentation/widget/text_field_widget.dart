import 'package:flutter/material.dart';
import 'package:thinka/core/utils/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;

  const TextFieldWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Let’s Thinka ',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 18),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            minLines: 1,
            maxLines: 10,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200], // Soft, clean background
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),

              hintText: 'Ask Thinka...',
              hintStyle: TextStyle(color: Colors.grey[600]),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none, // No border
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: AppColors.primary.withValues(alpha: 0.8),
                  width: 1.2,
                ),
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.send_rounded, color: AppColors.primary),
                onPressed: () {
                  // Trigger your AI logic here
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
