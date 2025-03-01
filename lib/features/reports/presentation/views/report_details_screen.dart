import 'package:flutter/material.dart';
import 'package:instant_project/core/utils/app_colors.dart';
import 'package:instant_project/core/utils/assets.dart';
import '../../data/models/show_report.dart';
import '../../data/repository/report_detail_api.dart';



class ReportDetailsScreen extends StatefulWidget {
  final int reportId;

  const ReportDetailsScreen({super.key, required this.reportId});

  @override
  _ReportDetailsScreenState createState() => _ReportDetailsScreenState();
}

class _ReportDetailsScreenState extends State<ReportDetailsScreen> {
  late Future<ReportDetail> _reportDetailsFuture;
  final ReportDetailsRepository  _repository = ReportDetailsRepository();

  @override
  void initState() {
    super.initState();
    _reportDetailsFuture = _repository.getReportDetails(widget.reportId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text(
          "Report Details",
          style: TextStyle(color: AppColors.textColor),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<ReportDetail>(
        future: _reportDetailsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}", style: TextStyle(color: Colors.red)),
            );
          } else if (!snapshot.hasData || snapshot.data!.data == null) {
            return const Center(child: Text("No report data available."));
          }

          final report = snapshot.data!.data!;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.grayColor3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: SizedBox(
                            height: 48,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: report.reportName,
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.zero,
                              ),
                              readOnly: true,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: report.status == "closed" ? Colors.grey : Colors.red,
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                        ),
                        child: TextButton(
                          onPressed: report.status == "closed" ? null : () {},
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            minimumSize: const Size(0, 48),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: const Text(
                            "End",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),


                Expanded(
                  child: ListView(
                    keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                    children: [
                      _buildCommentTile(
                        imagePath: AppAssets.LeadingImage,
                        name: report.user?.firstName ?? "Unknown",
                        specialization: report.user?.specialist ?? "No specialization",
                        dateTime: report.createdAt,
                        comment: "Description: ${report.description}\nNote: ${report.note}",
                      ),
                      const SizedBox(height: 16),
                      if (report.manager != null)
                        _buildCommentTile(
                          imagePath: AppAssets.ShawkyImage,
                          name: report.manager!.firstName,
                          specialization: report.manager!.specialist,
                          dateTime: report.manager!.updatedAt,
                          comment: "Manager's Response: ${report.answer}",
                        ),
                    ],
                  ),
                ),


                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Type your reply...",
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.transparent,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.upload, color: AppColors.grayColor2),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),


                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: () {},
                    child: const Text("Send", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCommentTile({
    required String imagePath,
    required String name,
    required String specialization,
    required String comment,
    required String dateTime,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagePath, width: 40, height: 40),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(specialization, style: const TextStyle(color: Colors.teal)),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(dateTime, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text(comment),
        ),
      ],
    );
  }
}