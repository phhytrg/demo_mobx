// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutors_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TutorsStore on TutorsBase, Store {
  late final _$tutorsAtom = Atom(name: 'TutorsBase.tutors', context: context);

  @override
  ObservableList<Tutor> get tutors {
    _$tutorsAtom.reportRead();
    return super.tutors;
  }

  @override
  set tutors(ObservableList<Tutor> value) {
    _$tutorsAtom.reportWrite(value, super.tutors, () {
      super.tutors = value;
    });
  }

  late final _$getTutorsAsyncAction =
      AsyncAction('TutorsBase.getTutors', context: context);

  @override
  Future<void> getTutors() {
    return _$getTutorsAsyncAction.run(() => super.getTutors());
  }

  @override
  String toString() {
    return '''
tutors: ${tutors}
    ''';
  }
}
