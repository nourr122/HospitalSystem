import 'package:flutter/material.dart';
import 'package:instant_project/core/utils/app_colors.dart';
import 'package:instant_project/core/utils/assets.dart';

class ReportDetailsScreen extends StatelessWidget {
  const ReportDetailsScreen({super.key});

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
      body: Padding(
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
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: SizedBox(
                height: 48, 
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Report Name",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
            ),
          ),


          Container(
            height: 48,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(8))
            ),
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 16),
                minimumSize: Size(0, 48),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                "End",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    ),
            SizedBox(height: 16),


            Expanded(
              child: ListView(
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                children: [
                  _buildCommentTile(
                    imagePath: AppAssets.LeadingImage,
                    name: "Ebrahem Elzainy",
                    specialization: "Specialist - Doctor",
                    dateTime: "13 Mar 2020 ",
                    comment: "Details note: Lorem Ipsum is simply dummy text of the printing and typesetting industry...",
                  ),
                  SizedBox(height: 16),
                  _buildCommentTile(
                    imagePath: AppAssets.ShawkyImage,
                    name: "Shawky Ahmed",
                    specialization: "Specialist - Doctor",
                    dateTime: "13 Mar 2020 ",
                    comment: "Details note: Lorem Ipsum is simply dummy text of the printing and typesetting industry...",
                    imageAttachment: AppAssets.hospitalImage,
                  ),
                ],
              ),
            ),


            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
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
                    icon: Icon(Icons.upload, color: AppColors.grayColor2),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  minimumSize: Size(double.infinity, 50),
                ),
                onPressed: () {},
                child: Text("Send", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCommentTile({
    required String imagePath,
    required String name,
    required String specialization,
    required String comment,
    required String dateTime,
    String? imageAttachment,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagePath, width: 40, height: 40),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(specialization, style: TextStyle(color: Colors.teal)),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(dateTime, style: TextStyle(color: Colors.grey, fontSize: 12)),
            ),
          ],
        ),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text(comment),
        ),
        if (imageAttachment != null) ...[
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Image.asset(imageAttachment, width: 200),
          ),
        ],
      ],
    );
  }
}
