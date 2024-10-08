// main.dart
import 'package:bulk_sync/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'db_healper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: CountDisplay());
  }
}

class CountDisplay extends StatefulWidget {
  const CountDisplay({super.key});

  @override
  _CountDisplayState createState() => _CountDisplayState();
}

class _CountDisplayState extends State<CountDisplay> {
 // final SyncService _syncService = SyncService();


  final _syncService = Get.put(SyncService()); //  SyncService

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(()=> Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Scheme Count: ${_syncService.schemeCount.value}',
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 20),
              Text(
                'Employee Count: ${_syncService.empCount.value}',
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () async{
                  await _syncService.syncData("emp_data_tbl", context);
                  await _syncService.syncData("scheme_data_tbl", context);
                },
                child: const Text("Sync Data"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
