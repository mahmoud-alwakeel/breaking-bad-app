import 'package:breaking_bad/consts/api_consts.dart';
import 'package:dio/dio.dart';

class CharactersWebServices {
  late Dio dio;

  CharactersWebServices() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: ApiConsts.baseUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    );
    Dio(baseOptions);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
  Response response = await dio.get('characters');
  print(response.data.toString());
  return response.data;
} catch (e) {
  print(e.toString());
  return [];
}

  }
}