

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../global_widgets/custom_dialog.dart';

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

  final List items;
  final List links;

  String errors = "";

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

      if (errors.isNotEmpty) errors = "";
      if (response.statusCode == 200 || response.statusCode == 201) {

        finishLoading();
        return response.data;
      } else if (response.statusCode == 400) {
        if (response.data['errors']["title"]) {
          receivedError();
        }
        errors = response.data['errors'].toString();
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

  Future postData(String url,   { required  parameters} ) async {
    try {
      Response response = await _dio.post(
        url,
        data:  parameters,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        finishLoading();
        print('Item added successfully!');
        return response.data['data'];

      }else if (response.statusCode == 400) {
        receivedError();
        errors = response.data['title'].toString();
        return response.data['title'];
      }
      else {
        receivedError();
        print('Error: ${response.statusCode}');
        throw Exception('Authentication Error');

      }
    } catch (e) {
      errors = e.toString();
      print('catch errrror: $errors');

    }
  }


  Future loadData([BuildContext context]);

  Future refreshData() async => await loadData();

  dynamic getItem(index) => items.isNotEmpty ? items[index] : null;

  int get getItemCount => items.length;

  bool get isLoading => _status == Status.loading;
  bool get loadingFailed => _status == Status.error;
  bool get online => _status == Status.onLine;
  bool get isLoaded => _status == Status.loaded;

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