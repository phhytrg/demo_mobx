import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

import '../domain/tutor.dart';

class TutorRepository{

  late final Dio dio;

  TutorRepository(){
    dio = Dio(BaseOptions(
      baseUrl: "https://sandbox.api.lettutor.com/",
      headers: {
        "Content-Type": "application/json",
        // Hard code token
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmNTY5YzIwMi03YmJmLTQ2MjAtYWY3Ny1lY2MxNDE5YTZiMjgiLCJpYXQiOjE3MDE0MTY3OTcsImV4cCI6MTcwMTUwMzE5NywidHlwZSI6ImFjY2VzcyJ9.vrnzqdONF6uvdDFWAceEVl_CeDyI9WfflbbpL68jsSA",
      },
    ));
  }

  Future<List<Tutor>> getTutors() async {
    Response response = await dio.post("/tutor/search",
      data: {
        "filters":{
          "date": null,
          "nationality":{},
          "specialities":[],
          "tutoringTimeAvailable":[null, null]
        },
        "page": 1,
        "perPage": 12,
      }
    );

    TutorResponse tutorResponse = TutorResponse.fromJson(response.data);
    return tutorResponse.rows ?? [];
  }

  toggleFavoriteTutor(String tutorId) {
    dio.post(
      "/user/manageFavoriteTutor",
      data: {
        "tutorId": tutorId,
      }
    );
  }
}

final tutorRepositoryProvider = Provider<TutorRepository>((ref) => TutorRepository());