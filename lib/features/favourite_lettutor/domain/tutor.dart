import 'package:json_annotation/json_annotation.dart';

part 'tutor.g.dart';
@JsonSerializable()
class TutorResponse{
  int? count;
  List<Tutor>? rows;

  TutorResponse({this.count, this.rows});

  factory TutorResponse.fromJson(Map<String, dynamic> json) => _$TutorResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TutorResponseToJson(this);
}

@JsonSerializable()
class Tutor{
  String id;
  String? avatar;
  String? name;
  bool? isFavoriteTutor;

  Tutor({required this.id, this.avatar, this.name, this.isFavoriteTutor});

  factory Tutor.fromJson(Map<String, dynamic> json) => _$TutorFromJson(json);
  Map<String, dynamic> toJson() => _$TutorToJson(this);
}