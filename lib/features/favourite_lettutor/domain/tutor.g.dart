// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TutorResponse _$TutorResponseFromJson(Map<String, dynamic> json) =>
    TutorResponse(
      count: json['count'] as int?,
      rows: (json['rows'] as List<dynamic>?)
          ?.map((e) => Tutor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TutorResponseToJson(TutorResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'rows': instance.rows,
    };

Tutor _$TutorFromJson(Map<String, dynamic> json) => Tutor(
      id: json['id'] as String,
      avatar: json['avatar'] as String?,
      name: json['name'] as String?,
      isFavoriteTutor: json['isFavoriteTutor'] as bool?,
    );

Map<String, dynamic> _$TutorToJson(Tutor instance) => <String, dynamic>{
      'id': instance.id,
      'avatar': instance.avatar,
      'name': instance.name,
      'isFavoriteTutor': instance.isFavoriteTutor,
    };
