import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data;
  final DioException? exception;
  const DataState({this.data, this.exception});

  // factory DataState.fromJson(Map<String, dynamic> json);
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
  // factory DataSuccess.fromJson(Map<String, dynamic> json) {
  //   // Assuming T has a fromJson factory method or can be parsed from JSON
  //   T data = json['data'] as T;
  //   return DataSuccess(data);
  // }
}

class DataException<T> extends DataState<T> {
  const DataException(DioException exception) : super(exception: exception);

  // factory DataException.fromJson(Map<String, dynamic> json) {
  //   // Assuming DioException has a fromJson factory method or can be parsed from JSON
  //   DioException exception = DioException(
  //     requestOptions: RequestOptions(path: ''),
  //     error: json['error'],
  //     response: Response(
  //       requestOptions: RequestOptions(path: ''),
  //       data: json['error'],
  //     ),
  //   );
  //   return DataException(exception);
  // }
}
