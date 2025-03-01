import 'package:flutter/material.dart';
import 'package:instant_project/core/ui/widgets/date_picker_widget.dart';
import 'package:instant_project/core/utils/app_colors.dart';
import 'package:instant_project/core/utils/assets.dart';
import '../../data/models/reports_model.dart';
import '../../data/repository/reports.dart';

import 'create_report.dart';
import 'report_details_screen.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  _ReportsScreenState createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  final ReportsRepository _reportsRepository = ReportsRepository();

  Future<AllReports>? _reportsFuture;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    print("Fetching reports...");

    try {
      AllReports fetchedReports = await _reportsRepository.getAllReports();
      print("Fetched Reports: ${fetchedReports.data}");

      setState(() {
        _reportsFuture = Future.value(fetchedReports);
      });
    } catch (e) {
      print("Error fetching reports: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Reports'),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: DatePickerWidget(
                  onDateChanged: (date) {},
                ),
              ),
              IconButton(
                icon: Image.asset(AppAssets.backgroundIcon),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CreateReport()),
                  );
                },
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder<AllReports>(
              future: _reportsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (snapshot.data?.data == null || snapshot.data!.data!.isEmpty) {
                  return const Center(child: Text("No reports available"));
                }

                final reports = snapshot.data!.data!;

                return ListView.builder(
                  padding: const EdgeInsets.only(top: 20),
                  itemCount: reports.length,
                  itemBuilder: (context, index) {
                    final report = reports[index];

                    if (report == null) {
                      return const SizedBox.shrink();
                    }

                    final String reportName = report.reportName ?? "No Name";
                    final String createdAt = report.createdAt ?? "Unknown Date";
                    final String status = report.status ?? "Unknown";
                    return GestureDetector(
                        onTap: () {
                          if (report.id != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ReportDetailsScreen(
                                  reportId: int.tryParse(report.id.toString()) ?? 0,
                                ),
                              ),
                            );
                          } else {
                            print("Error: report.id is null!");
                          }
                        },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  AppAssets.reportIcon,
                                  width: 40,
                                  height: 40,
                                ),
                                const SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      reportName,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      createdAt,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: status == "Finished"
                                    ? Colors.green.withOpacity(0.2)
                                    : Colors.orange.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                status,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: status == "Finished" ? Colors.green : Colors.orange,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}