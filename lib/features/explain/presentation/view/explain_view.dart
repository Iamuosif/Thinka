import 'package:flutter/material.dart';
import 'package:thinka/core/functions/navigation.dart';
import 'package:thinka/core/utils/app_assets.dart';
import 'package:thinka/core/utils/app_colors.dart';
import 'package:thinka/core/widgets/result_buttons.dart';
import 'package:thinka/core/widgets/result_card.dart';
import 'package:thinka/features/home/presentation/widget/ai_action_buttons_widget.dart';

class ExplainView extends StatelessWidget {
  const ExplainView({super.key, required this.result});
  final String result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Thinka Explains',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverToBoxAdapter(
                child: TweenAnimationBuilder(
                  tween: Tween<double>(begin: 1.0, end: 1.1),
                  duration: Duration(seconds: 2),
                  curve: Curves.easeInOut,
                  builder: (context, value, child) {
                    return Transform.scale(scale: value, child: child);
                  },
                  child: Hero(
                    tag: 'thinkaLogo',
                    child: Image.asset(Assets.logo, height: 70, width: 70),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 12)),
              SliverToBoxAdapter(
                child: Text(
                  'Here is the explanation:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ),
              SliverToBoxAdapter(child: ResultCardWidget(result: result)),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),
              const SliverToBoxAdapter(child: ResultButtons()),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),
              const SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    'Powered by Thinka AI 🤖',
                    style: TextStyle(color: Colors.black45, fontSize: 12),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
