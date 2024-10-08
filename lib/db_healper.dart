import 'dart:developer';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDB();
    return _db;
  }

  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), 'sync.db');
    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      // Create scheme_data_tbl with additional fields
      await db.execute('''
      CREATE TABLE IF NOT EXISTS scheme_data_tbl(
        id INTEGER PRIMARY KEY,
        scheme_opening_date TEXT,
        saving_scheme_no TEXT,
        customer_mobile_no TEXT,
        customer_name TEXT,
        maturity_date TEXT,
        discount_for_gold TEXT,
        discount_for_diamond_jewellery TEXT,
        installment_amount TEXT,
        total_installment_amount TEXT,
        unix_timestamp INTEGER,
        is_active INTEGER,
        remark TEXT,
        created_at TEXT,
        created_by TEXT,
        updated_at TEXT,
        updated_by TEXT
      )
      ''');

      // Create emp_data_tbl with additional fields
      await db.execute('''
      CREATE TABLE IF NOT EXISTS emp_data_tbl(
        id INTEGER PRIMARY KEY,
        empid INTEGER,
        emp_name TEXT,
        unix_timestamp INTEGER,
        is_active INTEGER,
        remark TEXT,
        created_at TEXT,
        created_by TEXT,
        updated_at TEXT,
        updated_by TEXT
      )
      ''');

      // Create unixTimeStampProcess table
      await db.execute('''
    CREATE TABLE IF NOT EXISTS unixTimeStampProcess (
      id INTEGER PRIMARY KEY,
      FinalUnixTimestamp TEXT,
      DailyUnixTimestamp TEXT,
      process_is TEXT
    )
    ''');
    });
  }

  Future<void> insertTableData(List<dynamic> data, String tableName,
      {bool isBulk = false, List<String> bulkInsertRecords = const []}) async {
    final dbClient = await db;

    if (isBulk) {
      // Construct and execute the bulk insert SQL query
      String query = "INSERT OR REPLACE INTO $tableName VALUES ${bulkInsertRecords.join(',')}";
      await dbClient!.transaction((txn) async {
        return await txn.execute(query);
      });
    } else {
      // Implement single insert logic if needed
    }
  }

  Future<dynamic> getMaxUnixTimeStamp(String tableName) async {
    final dbClient = await db;
    var result = await dbClient!
        .rawQuery("SELECT max(unix_timestamp) as maxTime FROM $tableName");
    return result.isNotEmpty ? result.first['maxTime'] : null; // Check if result is empty
  }

  Future<void> updateEmpUnixTimeStampProcessTable(
      String? unixTimestamp, String processIs,
      [String? dailyUnixTimestamp]) async {
    final dbClient = await db; // Ensure to await for the db instance
    String query = """
        INSERT OR REPLACE INTO unixTimeStampProcess (
          id, FinalUnixTimestamp, DailyUnixTimestamp, process_is) VALUES (1,
      '${dailyUnixTimestamp != null ? unixTimestamp != null && unixTimestamp.isNotEmpty ? unixTimestamp : "" : ""}', '$dailyUnixTimestamp',
        '$processIs')""";
    await dbClient!.execute(query); // Use the awaited dbClient instance
    log("Updated Unix Timestamp in DB: $unixTimestamp for process: $processIs");
  }

  // Method to get the count of records in a table
  Future<int> getRecordCount(String tableName) async {
    final dbClient = await db;
    final count = await dbClient!.rawQuery('SELECT COUNT(*) FROM $tableName');
    return Sqflite.firstIntValue(count) ?? 0;
  }
}
