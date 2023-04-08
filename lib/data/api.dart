import 'package:dio/dio.dart';
import 'package:flutter_application_2/models/anime.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi()
abstract  class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("https://api.jikan.moe/v4/anime")
  // Anime get();
  Future<Anime> get();
  

  // static ApiService create() {
  //   final dio = Dio();
  //   return ApiService(dio);
  // }
}