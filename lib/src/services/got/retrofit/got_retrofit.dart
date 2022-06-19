import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'models/dto_character.dart';
import 'models/dto_house.dart';

part 'got_retrofit.g.dart';

@RestApi()
abstract class GotRetrofit {
  factory GotRetrofit({
    required String baseUrl,
  }) {
    final dio = Dio(BaseOptions(baseUrl: baseUrl));
    return _GotRetrofit(dio);
  }

  @GET("/api/houses")
  Future<List<DTOHouse>> getListOfHouses(@Query("page") int page, @Query("pageSize") int pageSize);

  @GET("/api/houses/{id}")
  Future<DTOHouse> getHouse(@Path() String id);

  @GET("/api/characters/{id}")
  Future<DTOCharacter> getCharacter(@Path() String id);
}
