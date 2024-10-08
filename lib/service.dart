import 'dart:developer';
import 'package:another_flushbar/flushbar.dart';
import 'package:bulk_sync/const.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api_services.dart';
import 'db_healper.dart';

class SyncService extends GetxController {
  final ApiService _apiService = ApiService();
  final DBHelper _dbHelper = DBHelper();
  SharedPreferences? _prefs;

  final schemeCount = 0.obs;
  final empCount = 0.obs;

  SyncService() {
    _initializePrefs();
  }

  Future<void> _initializePrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> syncData(String tableName, context) async {
    // Fetch the last synced Unix timestamp from the database
    dynamic lastUnixTimestamp = await _dbHelper.getMaxUnixTimeStamp(tableName);

    // If lastUnixTimestamp is null, set it to 0 to fetch all data
    String? dailyUnixTimestampData = lastUnixTimestamp?.toString() ?? '0';
    bool hasMore = true;

    while (hasMore) {
      dynamic response;

      // Fetch the data based on the table name
      try {
        if (tableName == "emp_data_tbl") {
          response = await _apiService.getEmpData(
              dailyTimeStamp: dailyUnixTimestampData);
        } else if (tableName == "scheme_data_tbl") {
          response = await _apiService.getSchemeSync(
              dailyTimeStamp: dailyUnixTimestampData);
        } else {
          throw Exception("Invalid table name.");
        }
      } catch (e) {
        log('Error fetching data: $e');
        Flushbar(
          title: "Error",
          message: "Failed to fetch data: ${e.toString()}",
          duration: const Duration(seconds: 3),
        ).show(context);
        return; // Exit the method on error
      }

      // Log the raw response for debugging
      if (kDebugMode) {
        print('Raw Response: $response');
      }

      // Check if response is valid and has data
      if (response != null && response.status == 1) {
        if (response.data != null && response.data.isNotEmpty) {
          // Insert data into the respective table
          await _insertDataToTable(response.data, tableName);

          // Update the dailyUnixTimestampData for the next request
          dailyUnixTimestampData = response.data.last.unixTimestamp.toString();
          hasMore = response.hasmore ?? false;

          // Update the Unix timestamp in your process table
          await _updateUnixTimeStamp(dailyUnixTimestampData);
          await fetchCounts();
        } else {
          // Handle case where no data was found
          Flushbar(
            title: "No Data Found",
            message: "Data not found for $tableName.",
            duration: const Duration(seconds: 3),
          ).show(context);
          hasMore = false;
          await fetchCounts();
        }
      } else {
        // Handle case where response status is not 1
        Flushbar(
          title: "Error",
          message: response?.message ?? "Unknown error occurred.",
          duration: const Duration(seconds: 3),
        ).show(context);
        hasMore = false;
        await fetchCounts();
      }
    }
  }

  Future<void> _insertDataToTable(List<dynamic> data, String tableName) async {
    List<String> rows = [];

    for (var item in data) {
      Map<String, dynamic> jsonData = item.toJson();

      // Create a row for bulk insert
      String row = "(${jsonData.entries.map((e) {
        final value = e.value ?? ''; // Default to empty string if null
        return value is String ? '"$value"' : value.toString();
      }).join(",")})";
      rows.add(row);
    }

    // Insert into the database
    await _dbHelper.insertTableData(
      data,
      tableName,
      isBulk: true,
      bulkInsertRecords: rows,
    );
    await fetchCounts();
  }

  Future<void> _updateUnixTimeStamp(String? dailyUnixTimestampData) async {
    // Logic to update the Unix timestamp in your process table
    if (dailyUnixTimestampData != null) {
      await _prefs!.setString(
          SPKeys.empDailyUnixTimestamp.toString(), dailyUnixTimestampData);
      await _dbHelper.updateEmpUnixTimeStampProcessTable(
          dailyUnixTimestampData, 'dailySync', dailyUnixTimestampData);
    }
  }

  Future<void> fetchCounts() async {
    // Fetching counts from the database
    int schemeDataCount = await _dbHelper.getRecordCount('scheme_data_tbl');
    int empDataCount = await _dbHelper.getRecordCount('emp_data_tbl');

    // Update the state with the fetched counts
      schemeCount.value = schemeDataCount;
      empCount.value = empDataCount;
  }
}

