import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:thinka/features/explain/presentation/view/explain_view.dart';
import 'package:thinka/features/home/cubit/ai_cubit.dart';
import 'package:thinka/features/home/presentation/view/home.dart';
import 'package:thinka/features/quiz/presentation/view/quiz_view.dart';
import 'package:thinka/features/summary/presentation/view/summary_view.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder:
          (context, state) => BlocProvider(
            create: (context) => AiCubit(),
            child: const HomeView(),
          ),
    ),
    GoRoute(
      path: '/summary',
      builder: (context, state) {
        final result = state.extra as String;
        return SummaryView(result: result);
      },
    ),
    GoRoute(
      path: '/explain',
      builder: (context, state) {
        final result = state.extra as String;
        return ExplainView(result: result);
      },
    ),
    GoRoute(
      path: '/quiz',
      builder: (context, state) {
        final result = state.extra as String;
        return QuizView(result: result);
      },
    ),
  ],
);
