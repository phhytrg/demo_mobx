import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_demo/features/favourite_lettutor/data/tutor_repository.dart';
import 'package:mobx_demo/features/favourite_lettutor/presentation/tutors_store.dart';
import 'package:provider/provider.dart';

import '../domain/tutor.dart';
import 'tutor_card.dart';

class FavoriteTutorPage extends StatefulWidget {
  const FavoriteTutorPage({super.key});

  @override
  State<FavoriteTutorPage> createState() => _FavoriteTutorPageState();
}

class _FavoriteTutorPageState extends State<FavoriteTutorPage> {


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final tutorsStore = Provider.of<TutorsStore>(context);
    tutorsStore.getTutors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Tutors'),
      ),
      body: Observer(
        builder: (BuildContext context) {
          final tutorsStore = Provider.of<TutorsStore>(context);
          return tutorsStore.tutors.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : _buildTutorsList();
        },
      ),
    );
  }

  Widget _buildTutorsList() {
    final tutorsStore = Provider.of<TutorsStore>(context);
    return ListView.builder(
      itemCount: tutorsStore.tutors.length,
      itemBuilder: (context, index) {
        return TutorCard(tutor: tutorsStore.tutors[index],);
      },
    );
  }
}

