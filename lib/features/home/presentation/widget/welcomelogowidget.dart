import 'package:flutter/material.dart';
import 'package:thinka/core/utils/app_assets.dart';

class WelcomeLogoWidget extends StatelessWidget {
  const WelcomeLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Hero(
          tag: 'thinkaLogo',
          child: Image.asset(Assets.logo, height: 70, width: 70),
        ),

        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome, Yosif',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 1),
              Text(
                'Your AI study assistant',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
