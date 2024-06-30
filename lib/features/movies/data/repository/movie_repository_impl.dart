import 'dart:io';

import 'package:dio/dio.dart';
import 'package:lumina/core/constants/constants.dart';
import 'package:lumina/core/resources/data_state.dart';
import 'package:lumina/features/movies/data/model/actor_model.dart';
import 'package:lumina/features/movies/data/sources/api/api_service.dart';

import '../../domain/repository/movie_repository.dart';
import '../model/movie_model.dart';

class MovieRepositoryImpl implements MovieRepository {
  final ApiService _apiService;
  const MovieRepositoryImpl(this._apiService);
  @override
  Future<DataState<List<ActorModel>>> getActors(
      {int? id, String? mediaType}) async {
    try {
      final httpResponse = await _apiService.getActors(
        kApiKey: kApikey,
        mediaType: mediaType,
        id: id,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataException(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataException(e);
    }
  }

  @override
  Future<DataState<List<MovieModel>>> getCartoons() async {
    try {
      final httpResponse = await _apiService.getCartoons(
          kApiKey: kApikey, kAnimationGenre: kAnimationGenre);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataException(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataException(e);
    }
  }

  @override
  Future<DataState<List<MovieModel>>> getPopularMovies() async {
    try {
      final httpResponse = await _apiService.getPopularMovies(
        kApiKey: kApikey,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataException(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataException(e);
    }
  }

  @override
  Future<DataState<List<MovieModel>>> getTrending() async {
    try {
      final httpResponse = await _apiService.getTrending(
        kApiKey: kApikey,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataException(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataException(e);
    }
  }

  @override
  Future<DataState<List<MovieModel>>> getTv() async {
    try {
      final httpResponse = await _apiService.getTv(
        kApiKey: kApikey,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataException(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataException(e);
    }
  }

  @override
  Future<DataState<List<MovieModel>>> getUpcomingMovies() async {
    try {
      final httpResponse = await _apiService.getUpcomingMovies(
        kApiKey: kApikey,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataException(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataException(e);
    }
  }

  @override
  Future<List<MovieModel>> getFavourite() {
    // TODO: implement getFavourite
    throw UnimplementedError();
  }
}
