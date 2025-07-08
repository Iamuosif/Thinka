// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thinka/core/functions/navigation.dart';
import 'package:thinka/core/utils/app_colors.dart';
import 'package:thinka/features/home/cubit/ai_cubit.dart';
import 'package:thinka/features/home/cubit/ai_state.dart';
import 'package:thinka/features/home/presentation/widget/text_field_widget.dart';
import 'package:thinka/features/home/presentation/widget/thinka_buttons_widget.dart';
import 'package:thinka/features/home/presentation/widget/welcomelogowidget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      body: BlocListener<AiCubit, AiState>(
        listener: (context, state) {
          if (state is AiSuccess) {
            final result = state.result;
            final mode = state.mode;

            Future.microtask(() {
              if (mode == "explain") {
                customDataNavigate(context, '/explain', data: result);
              } else if (mode == "summarize") {
                customDataNavigate(context, '/summary', data: result);
              } else if (mode == "quiz") {
                customDataNavigate(context, '/quiz', data: result);
              }
            });
          }
        },
        child: SafeArea(
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
                SliverToBoxAdapter(
                  child: ThinkaButtonsWidget(controller: controller),
                ),

                SliverToBoxAdapter(child: SizedBox(height: 24)),
                SliverToBoxAdapter(
                  child: BlocBuilder<AiCubit, AiState>(
                    builder: (context, state) {
                      if (state is AiLoading) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ),
                        );
                      } else if (state is AiSuccess) {
                      } else if (state is AiError) {
                        return Text(
                          state.message,
                          style: TextStyle(color: Colors.red),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
