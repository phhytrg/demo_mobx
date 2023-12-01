import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx_demo/features/counter/presentation/counter_page.dart';
import 'package:mobx_demo/features/favourite_lettutor/data/tutor_repository.dart';
import 'package:mobx_demo/features/favourite_lettutor/presentation/favorite_tutor_page.dart';
import 'package:mobx_demo/features/favourite_lettutor/presentation/tutors_store.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    Provider<TutorsStore>(
      create: (context) => TutorsStore(TutorRepository()),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    final router = GoRouter(routes: [
      GoRoute(
          path: '/counter',
          builder: (context, state) => const CounterPage(title: "Counter Page")
      ),
      GoRoute(
        path: '/',
        redirect: (context, state) => '/counter',
      ),
      GoRoute(
        path: '/favorites',
        builder: (context, state) => const FavoriteTutorPage(),
      ),
    ]);

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}

