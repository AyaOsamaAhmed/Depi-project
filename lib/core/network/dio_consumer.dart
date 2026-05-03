import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:dipe_freelance/core/errors/exceptions.dart';
import 'package:dipe_freelance/core/network/api_consumer.dart';
import 'package:dipe_freelance/core/network/end_points.dart';

@LazySingleton(as: ApiConsumer)
class DioConsumer implements ApiConsumer {
  final Dio client;

  DioConsumer({required this.client});

  @override
  Future get(String path, {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.get(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      _handleDioException(e);
    }
  }

  @override
  Future post(String path,
      {Object? data, Map<String, dynamic>? queryParameters, bool isFormData = false}) async {
    try {
      final response = await client.post(
        path,
        data: isFormData ? FormData.fromMap(data as Map<String, dynamic>) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      _handleDioException(e);
    }
  }

  @override
  Future patch(String path,
      {Object? data, Map<String, dynamic>? queryParameters, bool isFormData = false}) async {
    try {
      final response = await client.patch(
        path,
        data: isFormData ? FormData.fromMap(data as Map<String, dynamic>) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      _handleDioException(e);
    }
  }

  @override
  Future put(String path,
      {Object? data, Map<String, dynamic>? queryParameters, bool isFormData = false}) async {
    try {
      final response = await client.put(
        path,
        data: isFormData ? FormData.fromMap(data as Map<String, dynamic>) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      _handleDioException(e);
    }
  }

  @override
  Future delete(String path,
      {Object? data, Map<String, dynamic>? queryParameters, bool isFormData = false}) async {
    try {
      final response = await client.delete(
        path,
        data: isFormData ? FormData.fromMap(data as Map<String, dynamic>) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      _handleDioException(e);
    }
  }

  void _handleDioException(DioException e) {
    if (e.type == DioExceptionType.badResponse) {
      final data = e.response?.data;
      String message = 'Unknown Error';
      
      if (data is Map<String, dynamic> && data.containsKey(ApiKey.errorMessage)) {
        message = data[ApiKey.errorMessage];
      } else if (data is String) {
        message = data;
      }
      
      throw ServerException(errorMessageModel: message);
    } else {
      throw ServerException(errorMessageModel: e.message ?? 'Unknown network error');
    }
  }
}
