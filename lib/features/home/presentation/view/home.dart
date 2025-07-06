import 'package:flutter/material.dart';
import 'package:thinka/features/home/presentation/widget/text_field_widget.dart';
import 'package:thinka/features/home/presentation/widget/thinka_buttons_widget.dart';
import 'package:thinka/features/home/presentation/widget/welcomelogowidget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 18)),
              SliverToBoxAdapter(child: WelcomeLogoWidget()),
              SliverToBoxAdapter(child: SizedBox(height: 180)),
              SliverToBoxAdapter(
                child: TextFieldWidget(controller: controller),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 24)),
              SliverToBoxAdapter(child: ThinkaButtonsWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
