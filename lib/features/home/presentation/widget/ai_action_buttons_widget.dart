import 'package:flutter/material.dart';
import 'package:thinka/core/utils/app_colors.dart';

class AiActionButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  const AiActionButton({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 16, color: Colors.white),
      label: Text(title),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(100, 48),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
