// services/api_service.dart
import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../models/emp_model.dart';
import 'api_client.dart';
import 'app_url.dart';
import 'models/custom_scheme_model.dart';

class ApiService {
  final Dio _dio = Dio();

  final APIClient _apiClient = APIClient();

  // API Product Sync Repo
  Future<CustomerSchemeModel?> getSchemeSync(
      {required String? dailyTimeStamp}) async {
    try {
      String productDataUrl =
          "${AppUrl.baseUrl()}${AppUrl.getUnixTimestampsData}/${dailyTimeStamp == 'null' ? '0' : dailyTimeStamp}";


      if (kDebugMode) {
        print("productData Url=$productDataUrl");
      }

      final productResponse = await _apiClient.get(
        productDataUrl,
      );
      if (productResponse.isNotEmpty) {
        print(productResponse);
        return CustomerSchemeModel.fromJson(productResponse);
      } else {
        Flushbar(title: productResponse['message']);
      }
    } on DioException catch (ex) {
      if (kDebugMode) {
        print(ex.response?.data);
      }
      rethrow;
    } on SocketException catch (ex) {
      rethrow;
    }
  }

  // API Product Sync Repo
  Future<EmpModel?> getEmpData({required String? dailyTimeStamp}) async {
    try {
      String productDataUrl =
          "${AppUrl.baseUrl()}${AppUrl.getSalesEmpData}/${dailyTimeStamp == 'null' ? '0' : dailyTimeStamp}";

      if (kDebugMode) {
        print("empData Url=$productDataUrl");
      }

      final productResponse = await _apiClient.get(
        productDataUrl,
      );
      if (productResponse.isNotEmpty) {
        if (kDebugMode) {
          print(productResponse);
        }
        return EmpModel.fromJson(productResponse);
      } else {
        Flushbar(title: productResponse['message']);
      }
    } on DioException catch (ex) {
      if (kDebugMode) {
        print(ex.response?.data);
      }
      rethrow;
    } on SocketException catch (ex) {
      rethrow;
    }
  }
}
