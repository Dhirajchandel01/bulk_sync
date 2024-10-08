// import 'dart:convert';
//
// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart' as g;
// import 'package:mycs/res/strings.dart';
// import 'package:mycs/utils/auth/auth_manager.dart';
// import 'package:mycs/utils/common.dart';
// import 'package:mycs/utils/methods.dart';
// import 'package:mycs/utils/sizes.dart';
// import 'package:mycs/utils/text_styles.dart';
//
// class APIClient {
//   bool isTesting;
//   AuthManager _authManager;
//   Dio _dio;
//   APIClient({this.isTesting = false}){
//     if(!isTesting)
//     _authManager = g.Get.put(AuthManager());
//     _dio  = Dio();
//   }
//
//
//  // final Dio _dio = Dio();
//
//   _requestHeaders() {
//     // return _authManager.isUserLoggedIn()
//     //     ? {
//     //         'Content-Type': 'application/json',
//     //         'authorization': 'bearer ${_authManager.getLoginScreenData().accessToken}'
//     //       }
//     //     : {
//     //         'Content-Type': 'application/json',
//     //       };
//   }
//
//
//
//
//   Future<Map<String, dynamic>> get(
//     String path, {
//     Map<String, dynamic> queryParameters,
//   }) async {
//     Map<String, dynamic> responseData = Map();
//
//     try {
//       Response response = await _dio.get(
//         Uri.encodeFull(path),
//         options: isTesting ? null : Options(
//           headers: _requestHeaders(),
//         ),
//         queryParameters: queryParameters,
//       );
//       if (response.data.runtimeType == String) {
//         if (response.data.toString().isNotEmpty) {
//           try {
//             responseData = json.decode(response.data);
//           } on FormatException catch(ex){
//              return {'data': response.data};
//           }
//         }
//       } else
//         responseData = response.data;
//       // responseData = response.data;
//     } on DioError catch (e) {
//       if (e.response == null) throw e;
//       if (e.response.statusCode == null) throw e;
//       if (e.response.statusCode == 401) {
//         log("unauthorized");
//
//         if(_authManager != null) {
//           _authManager.logoutUser();
//           Common.toast(Strings.sessionExpired);
//         }
//       } else
//         throw e;
//     }
//     return responseData;
//   }
//
//   Future<Map<String, dynamic>> post(
//     String path, {
//     Map<String, dynamic> data,
//     bool isJson = false,
//     FormData formData,
//     Map<String, dynamic> queryParameters,
//     Map<String, dynamic> headers,
//     bool logoutOnUnauthorized = true,
//   }) async {
//     log("API URL $path");
//    // log("API POST ${jsonEncode(data)}");
//     Map<String, dynamic> responseData = Map();
//     try {
//       Response response = await _dio.post(
//         Uri.encodeFull(path),
//         data: data != null
//             ? isJson
//                 ? jsonEncode(data)
//                 : FormData.fromMap(data)
//             : formData,
//         options: Options(headers: {"Content-Type": "multipart/form-data"}),
//         queryParameters: queryParameters,
//       );
//       print("hiii");
//       // try {
//       //   if(response.data == String)
//       //   {
//       //     print("hiii.........s");
//       //     responseData = jsonDecode(response.data);
//       //     print("hiii");
//       //   }
//       //   else {
//       //     print("hiii else");
//       //     responseData = response.data;
//       //     print("hiii $responseData");
//       //   }
//       // } on Exception catch(ex){
//       //   Common.toast(ex.toString());
//       //   if (kDebugMode) {
//       //     print(ex.toString());
//       //   }
//       //   rethrow;
//       // }
//
//       if (response.data.runtimeType == String) {
//         responseData = json.decode(response.data);
//       } else {
//         responseData = response.data;
//       }
//
//       //    responseData = json.decode(response.data) as Map<String, dynamic>;
//       // print("$responseData");
//     } on DioException catch (e) {
//     log(e.response.data.toString());
//       if (e.response == null) throw e;
//       if (e.response.statusCode == null) throw e;
//       if (e.response.statusCode == 500) {
//         g.Get.defaultDialog(
//             title: "Server error!",
//             titleStyle:
//                 TextStyles.defaultRegular.copyWith(fontSize: FontSizes.s13),
//             content: Text(
//               "${e.message}",
//               style:
//                   TextStyles.defaultRegular.copyWith(fontSize: FontSizes.s10),
//             ));
//       }
//       if (e.response.statusCode == 401 && logoutOnUnauthorized) {
//         log("unauthorized");
//         if(_authManager != null) {
//           Common.toast(Strings.sessionExpired);
//           _authManager.logoutUser();
//         }
//       } else
//         throw e;
//     }
//
//     return responseData;
//   }
//
//   Future<Map<String, dynamic>> patch(
//     String path, {
//     Map data,
//     FormData formData,
//     Map<String, dynamic> queryParameters,
//     Map<String, dynamic> headers,
//   }) async {
//     log("API URL $path");
//     Map<String, dynamic> responseData = Map();
//
//     try {
//       Response response = await _dio.patch(
//         Uri.encodeFull(path),
//         data: data ?? formData,
//         options: Options(
//           headers: headers ?? _requestHeaders(),
//         ),
//         queryParameters: queryParameters,
//       );
//
//       responseData = response.data;
//     } on DioError catch (e) {
//       if (e.response == null) throw e;
//       if (e.response.statusCode == null) throw e;
//       if (e.response.statusCode == 401) {
//         log("unauthorized");
//         if(_authManager != null) {
//           Common.toast(Strings.sessionExpired);
//           _authManager.logoutUser();
//         }
//       } else
//         throw e;
//     }
//
//     return responseData;
//   }
// }

import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as g;

class RetryInterceptor extends Interceptor {
  final Dio? dio;
  final int? maxRetries;
  final int? retryDelay;

  RetryInterceptor({this.dio, this.maxRetries = 1, this.retryDelay = 2000});

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    if (_shouldRetry(err) &&
        err.requestOptions.extra['retryCount'] < maxRetries) {
      err.requestOptions.extra['retryCount']++;
      await Future.delayed(Duration(milliseconds: retryDelay!));
      try {
        final response = await dio!.request(
          err.requestOptions.path,
          options: Options(
            method: err.requestOptions.method,
            headers: err.requestOptions.headers,
          ),
          data: err.requestOptions.data,
          queryParameters: err.requestOptions.queryParameters,
        );
        return handler.resolve(response);
      } catch (e) {
        return super.onError(err, handler);
      }
    }
    return super.onError(err, handler);
  }

  bool _shouldRetry(DioException err) {
    return err.type != DioExceptionType.cancel &&
        err.type != DioExceptionType.badResponse &&
        err.response?.statusCode != 401;
  }
}

class APIClient {
  bool? isTesting;

  // AuthManager? _authManager;
  Dio? _dio;

  APIClient({this.isTesting = false}) {
    _dio = Dio();
    // _dio!.interceptors.add(RetryInterceptor(dio: _dio));
  }

  _requestHeaders() {
    // return _authManager?.isUserLoggedIn() == true
    //     ? {
    //   'Content-Type': 'application/json',
    //   'authorization': 'bearer ${_authManager.getLoginScreenData().accessToken}'
    // }
    //     : {
    //   'Content-Type': 'application/json',
    // };
  }

  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    Map<String, dynamic> responseData = {};
    try {
      Response response = await _dio!.get(
        Uri.encodeFull(path),
        options: isTesting!
            ? null
            : Options(
                headers: _requestHeaders(),
                // extra: {'retryCount': 0},
              ),
        queryParameters: queryParameters,
      );
      if (response.data.runtimeType == String) {
        if (response.data.toString().isNotEmpty) {
          try {
            responseData = json.decode(response.data);
          } on FormatException {
            return {'data': response.data};
          }
        }
      } else if (response.data.runtimeType == List<dynamic>) {
        return {'data': response.data};
      } else {
        responseData = response.data;
      }
    } on DioException catch (e) {
      if (e.response == null) rethrow;
      if (e.response!.statusCode == null) rethrow;
      if (e.response!.statusCode == 401) {
        log("unauthorized");
      } else {
        rethrow;
      }
    }
    return responseData;
  }

  Future<Map<String, dynamic>> post(
    String path, {
    Map<String, dynamic>? data,
    bool isJson = false,
    FormData? formData,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool logoutOnUnauthorized = true,
  }) async {
    log("API URL $path");
    Map<String, dynamic> responseData = {};
    try {
      Response response = await _dio!.post(
        Uri.encodeFull(path),
        data: data != null
            ? isJson
                ? jsonEncode(data)
                : FormData.fromMap(data)
            : formData,
        options: Options(
          headers: {"Content-Type": "multipart/form-data"},
          // extra: {'retryCount': 2},
        ),
        queryParameters: queryParameters,
      );
      if (response.data.runtimeType == String) {
        responseData = json.decode(response.data);
      } else {
        responseData = response.data;
      }
    } on DioException catch (e) {
      if (e.response == null) rethrow;
      if (e.response?.statusCode == null) rethrow;
      if (e.response?.statusCode == 500) {
        g.Get.defaultDialog(
            title: "Server error!",
            content: Text(
              "${e.message}",
            ));
      }
      if (e.response?.statusCode == 401 && logoutOnUnauthorized) {
        log("unauthorized");
      } else {
        rethrow;
      }
    }
    return responseData;
  }

  Future<Map<String, dynamic>> patch(
    String path, {
    Map? data,
    FormData? formData,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    log("API URL $path");
    Map<String, dynamic> responseData = {};
    try {
      Response response = await _dio!.patch(
        Uri.encodeFull(path),
        data: data ?? formData,
        options: Options(
          headers: headers ?? _requestHeaders(),
          // extra: {'retryCount': 0},
        ),
        queryParameters: queryParameters,
      );
      responseData = response.data;
    } on DioException catch (e) {
      if (e.response == null) rethrow;
      if (e.response!.statusCode == null) rethrow;
      if (e.response!.statusCode == 401) {
        log("unauthorized");
      } else {
        rethrow;
      }
    }
    return responseData;
  }
}
