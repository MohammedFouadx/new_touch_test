

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

enum Status { loading, error, loaded, onLine }

String next = '';

abstract class AppProvider with ChangeNotifier {
  final Dio _dio = Dio(
    BaseOptions(
        responseType: ResponseType.json,
        connectTimeout: const Duration(milliseconds: 80000),
        receiveTimeout: const Duration(milliseconds: 80000),
        headers: {
          'Content-type': 'application/json-patch+json',
        },
        validateStatus: (code) {
          if ((code! >= 200 && code <= 300) || code == 401) {
            return true;
          }
          return false;
        }),
  );

  // Lists of both models info & its photos
  final List items;
  final List links;

  Map errors = Map();

  // Model's status regarding data loading capabilities
  Status? _status;



  AppProvider(BuildContext  context)
      : items = [],
        links = [] {
    startLoading();
    loadData(context);
  }




  Future fetchDataFromServer(String url, {Map<String, dynamic>? parameters}) async {
    try {
      final response = await _dio.get(url,
          queryParameters: parameters,
          options: Options(
              headers: {
                'Content-type': 'application/json-patch+json',
          }));


      if (!url.contains('page')) items.clear();
      if (errors.isNotEmpty) errors.clear();
      if (response.statusCode == 200 || response.statusCode == 201) {

        finishLoading();
        return response.data;
      } else if (response.statusCode == 401) {
        if (response.data['error']["massage"] == "Unauthorized")
        receivedError();
        errors = response.data['error'];
        return errors;
      } else {
        receivedError();
        throw Exception('Authentication Error');
      }
    } on DioError catch (exception) {
      if (exception == null ||
          exception.toString().contains('SocketException')) {
        throw Exception("Network Error");
      } else if (exception.type == DioErrorType.receiveTimeout ||
          exception.type == DioErrorType.connectionTimeout) {
        throw Exception(
            "Could'nt connect, please ensure you have a stable network.");
      } else {
        return [];
      }
    }
  }


  Future fetchData(String url, {Map<String, dynamic>? parameters}) async {
    try {
      final response = await _dio.get(url,
          queryParameters: parameters,
          options: Options(headers: {
            'Content-type': 'application/json-patch+json',
          }));
      if (items.isNotEmpty) items.clear();

      if (errors.isNotEmpty) errors.clear();
      if (response.statusCode == 200 || response.statusCode == 201) {
        finishLoading();
        return response.data['data'];
      } else if (response.statusCode == 401) {
        if (response.data['error']["massage"] == "Unauthorized")
        receivedError();
        errors = response.data['error'];
        return errors;
      } else {
        receivedError();
        throw Exception('Authentication Error');
      }
    } on DioError catch (exception) {
      if (exception == null ||
          exception.toString().contains('SocketException')) {
        throw Exception("Network Error");
      } else if (exception.type == DioErrorType.receiveTimeout ||
          exception.type == DioErrorType.connectionTimeout) {
      } else {
        return [];
      }
    }
  }


  Future saveData(String url,   { required Map<String, dynamic> parameters}) async {
    try {
      errors.clear();
      final response = await _dio.post(url,
          data: FormData.fromMap(parameters),
          options: Options(headers: {
            'Content-type': 'application/json-patch+json',
          }));
      //if (items.isNotEmpty) items.clear();

      if (response.statusCode == 200 || response.statusCode == 201) {
        finishLoading();
        return response.data['data'];
      } else if (response.statusCode == 401) {
        receivedError();
        errors = response.data['error'];
        return response.data['error'];
      } else {
        receivedError();
        throw Exception('Authentication Error');
      }
    } on DioError catch (exception) {
      receivedError();
      if (exception == null ||
          exception.toString().contains('SocketException')) {
        throw Exception("Network Error");
      } else if (exception.type == DioErrorType.receiveTimeout ||
          exception.type == DioErrorType.connectionTimeout) {
        throw Exception(
            "Could'nt connect, please ensure you have a stable network.");
      } else {
        return null;
      }
    }
  }

  Future saveDataWithoutFormData(String url, { required Map<String, dynamic> parameters}) async {
    try {
      errors.clear();
      final response = await _dio.post(url,
          data: parameters,
          options: Options(headers: {
            'Content-type': 'application/json-patch+json',
          }));
      if (items.isNotEmpty) items.clear();

      if (response.statusCode == 200 || response.statusCode == 201) {
        finishLoading();
        return response.data['data'];
      } else if (response.statusCode == 401) {
        if (response.data['error']["massage"] == "Unauthorized")
        receivedError();
        errors = response.data['error'];

        return errors;
      } else {
        receivedError();
        throw Exception('Authentication Error');
      }
    } on DioError catch (exception) {
      receivedError();
      if (exception == null ||
          exception.toString().contains('SocketException')) {
        throw Exception("Network Error");
      } else if (exception.type == DioErrorType.receiveTimeout ||
          exception.type == DioErrorType.connectionTimeout) {
        throw Exception(
            "Could'nt connect, please ensure you have a stable network.");
      } else {
        return null;
      }
    }
  }


  // Overridable method, used to load the model's data
  Future loadData([BuildContext context]);

  // Reloads model's data
  Future refreshData() async => await loadData();

  // General getters for both lists
  dynamic getItem(index) => items.isNotEmpty ? items[index] : null;

  int get getItemCount => items.length;

  // Status getters
  bool get isLoading => _status == Status.loading;
  bool get loadingFailed => _status == Status.error;
  bool get online => _status == Status.onLine;
  bool get isLoaded => _status == Status.loaded;

  // Methods which update the [_status] variable
  void isOnline() {
    _status = Status.onLine;
  }

  void startLoading() {
    _status = Status.loading;
  }

  void finishLoading() {
    _status = Status.loaded;
    notifyListeners();
  }

  void receivedError() {
    _status = Status.error;
    notifyListeners();
  }

}