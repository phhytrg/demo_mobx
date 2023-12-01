
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../data/tutor_repository.dart';
import '../domain/tutor.dart';
import 'tutors_store.dart';

class TutorCard extends StatefulWidget {
  const TutorCard({super.key, required this.tutor});

  final Tutor tutor;

  @override
  State<TutorCard> createState() => _TutorCardState();
}

class _TutorCardState extends State<TutorCard> {

  @override
  Widget build(BuildContext context) {
    widget.tutor.isFavoriteTutor ??= false;
    print("build ${widget.tutor.name} ${widget.tutor.isFavoriteTutor}");
    final tutorsStore = context.read<TutorsStore>();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black12),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(widget.tutor.avatar!),
                maxRadius: 40,
              ),
              Text(widget.tutor.name!),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () async {
                await tutorsStore.toggleFavoriteTutor(widget.tutor.id);
                // setState(() {
                //   widget.tutor.isFavoriteTutor = !widget.tutor.isFavoriteTutor!;
                // });
                await tutorsStore.getTutors();
              },
              icon: widget.tutor.isFavoriteTutor! == true ? const Icon(Icons.favorite, color: Colors.red,)
                  : const Icon(Icons.favorite_border),
            ),
          ),
        ],
      ),
    );
  }
}