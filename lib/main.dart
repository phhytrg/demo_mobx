import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx_demo/features/counter/presentation/counter_store.dart';
import 'package:mobx_demo/features/counter/presentation/counter_page.dart';
import 'package:mobx_demo/features/favourite_lettutor/data/tutor_repository.dart';
import 'package:mobx_demo/features/favourite_lettutor/presentation/favorite_tutor_page.dart';
import 'package:mobx_demo/features/favourite_lettutor/presentation/tutors_store.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    Provider<TutorsStore>(
      create: (context) => TutorsStore(TutorRepository()),
    ),
    Provider<CounterStore>(
      create: (context) => CounterStore(),
    ),
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
        builder: (context, state) => const MyHomePage(),
      ),
      GoRoute(
        path: '/favorites',
        builder: (context, state) => const FavoriteTutorPage(),
      ),
    ],
      initialLocation: '/',
    );

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

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          OutlinedButton(
              onPressed: () {
                context.go('/counter');
              },
              child: const Text('Counter Page')),
          const SizedBox(height: 16,),
          OutlinedButton(
              onPressed: () {
                context.go('/favorites');
              },
              child: const Text('Favorite Tutors')),
        ],
      ),
    );
  }
}


