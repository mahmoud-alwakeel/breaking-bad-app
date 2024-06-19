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
    dio = Dio(baseOptions);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
  Response response = await dio.get('character');
  print(response.data.toString());
  return response.data['results'];
} catch (e) {
  print(e.toString());
  return [];
}

  }
}