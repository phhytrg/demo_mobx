

import 'package:mobx/mobx.dart';
import 'package:mobx_demo/features/favourite_lettutor/data/tutor_repository.dart';
import 'package:riverpod/riverpod.dart';

import '../domain/tutor.dart';

part 'tutors_store.g.dart';

class TutorsStore = TutorsBase with _$TutorsStore;

abstract class TutorsBase with Store{
  final TutorRepository _tutorRepository;

  TutorsBase(this._tutorRepository);

  @observable
  ObservableList<Tutor> tutors = ObservableList<Tutor>.of([]);

  @action
  Future<void> getTutors() async {
    tutors = ObservableList<Tutor>.of([]);
    tutors = ObservableList<Tutor>.of(await _tutorRepository.getTutors());
  }

  Future<void> toggleFavoriteTutor(String tutorId) async {
    await _tutorRepository.toggleFavoriteTutor(tutorId);
  }
}

final tutorsStoreProvider = Provider<TutorsStore>((ref) => TutorsStore(ref.read(tutorRepositoryProvider)));