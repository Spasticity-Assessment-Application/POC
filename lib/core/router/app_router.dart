import 'package:go_router/go_router.dart';
import 'package:poc/features/home/presentation/home_page.dart';
import 'package:poc/features/camera/camera.dart';
import 'package:poc/features/photo_display/photo_display.dart';
import 'package:poc/features/photo_display/presentation/pages/result_page.dart';
class AppRouter {
  GoRouter get router => GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(path: '/home', builder: (context, state) => const HomePage()),
      GoRoute(path: '/camera', builder: (context, state) => const CameraPage()),
      GoRoute(
        path: '/photo-display',
        builder: (context, state) => const PhotoDisplayPage(),
      ),
      GoRoute(
        path: '/result',
        builder: (context, state) => const ResultPage(),
      ),

    ],
  );
}
