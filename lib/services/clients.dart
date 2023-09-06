import '../utils/utils.dart';

class Clients {

    Dio productClient = Dio(BaseOptions(
    baseUrl: 'https://jsonplaceholder.typicode.com/',
    contentType: Headers.jsonContentType,
    responseType: ResponseType.json,
    validateStatus: (_) => true,
    connectTimeout: const Duration(minutes: 10),
    receiveTimeout: const Duration(minutes: 10),
  ))
    ..interceptors.addAll([
      // AuthorizationInterceptor(),
      // DioFirebasePerformanceInterceptor(),
      LoggerInterceptor(),
      // TokenInterceptor(),
      // NetworkInterceptor(),
    ]);
    get getClient=>productClient;
}
