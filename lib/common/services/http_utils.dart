import 'package:dio/dio.dart';

import '../utils/constants.dart';

class BookApiUtils {
  late Dio dio;

  static final BookApiUtils _instance = BookApiUtils._internals();

  factory BookApiUtils() {
    return _instance;
  }

  BookApiUtils._internals() {
    BaseOptions options = BaseOptions(
        baseUrl: AppConstant.bookApi,
        responseType: ResponseType.json,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        contentType: 'application/json: charset=utf-8',
        headers: {});
    dio = Dio(options);
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) {
          ErrorEntity info = createErrorEntity(error);
          onError(info);
        },
        onRequest: (request, handler) {
          handler.next(request);
        },
        onResponse: (response, handler) {
          handler.next(response);
        },
      ),
    );
  }

  Future<List> getData(
    path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    var response = await dio.get(path, queryParameters: queryParameters);
    return response.data['results'];
  }
}

// Error Entity

class ErrorEntity implements Exception {
  int code = -1;
  String message = "";

  ErrorEntity({required this.code, required this.message});

  @override
  String toString() {
    if (message == "") return "Exception";

    return "Exception code $code, $message";
  }
}

ErrorEntity createErrorEntity(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return ErrorEntity(code: -1, message: "Connection timed out");

    case DioExceptionType.sendTimeout:
      return ErrorEntity(code: -1, message: "Send timed out");

    case DioExceptionType.receiveTimeout:
      return ErrorEntity(code: -1, message: "Receive timed out");

    case DioExceptionType.badCertificate:
      return ErrorEntity(code: -1, message: "Bad SSL certificates");

    case DioExceptionType.badResponse:
      switch (error.response!.statusCode) {
        case 400:
          return ErrorEntity(code: 400, message: "Bad request");
        case 401:
          return ErrorEntity(code: 401, message: "Permission denied");
        case 500:
          return ErrorEntity(code: 500, message: "Server internal error");
      }
      return ErrorEntity(
          code: error.response!.statusCode!, message: "Server bad response");

    case DioExceptionType.cancel:
      return ErrorEntity(code: -1, message: "Server canceled it");

    case DioExceptionType.connectionError:
      return ErrorEntity(code: -1, message: "Connection error");

    case DioExceptionType.unknown:
      return ErrorEntity(code: -1, message: "Unknown error");
  }
}

void onError(ErrorEntity eInfo) {
  print('error.code -> ${eInfo.code}, error.message -> ${eInfo.message}');
  switch (eInfo.code) {
    case 400:
      print("Server syntax error");
      break;
    case 401:
      print("You are denied to continue");
      break;
    case 500:
      print("Server internal error");
      break;
    default:
      print("Unknown error");
      break;
  }
}

class FirebaseAuthUtils {
  late Dio dio;
}
