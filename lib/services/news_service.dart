import 'package:dio/dio.dart';
import 'package:news_app_usimg_riverpod/constants/constants.dart';

class NewsService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiUrls.baseUrl,
      responseType: ResponseType.json,
    ),
  );

  fetchNews() async {
    final response = await _dio.get('&language=en');

    return response.data;
  }
}
