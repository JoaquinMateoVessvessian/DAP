import 'package:app1/presentation/screens/homescreen.dart';
import 'package:app1/presentation/screens/loginscreen.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) {
        final extra = state.extra as Map<String, String>;
        final name = extra['name'] ?? '';
        final mail = extra['mail'] ?? '';
        return HomeScreen(name: name, mail: mail);
      },
    ),
  ],
);