import 'package:go_router/go_router.dart';
import 'package:thinka/features/home/presentation/view/home.dart';

final GoRouter router = GoRouter(
  routes: [GoRoute(path: '/', builder: (context, state) => const HomeView())],
);
