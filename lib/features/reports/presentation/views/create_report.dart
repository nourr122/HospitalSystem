import 'package:flutter/material.dart';
import 'package:instant_project/core/utils/app_colors.dart';
import 'package:instant_project/core/utils/assets.dart';
import 'reports_screen.dart';

class CreateReport extends StatelessWidget {
  const CreateReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text(
          'Create Report',
          style: TextStyle(color: AppColors.TitleColor),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),


            Container(
              width: double.infinity,
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.NameReport),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: const Color(0xFFD8D8D8),
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              alignment: Alignment.centerLeft,
              child: Image.asset(AppAssets.ReportName),
            ),

            const SizedBox(height: 16),


            Container(
              width: double.infinity,
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.DescriptionReport),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: const Color(0xFFD8D8D8),
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              alignment: Alignment.topLeft,
             child: Image.asset(AppAssets.InputText),
            ),
            SizedBox(height: 18),
            Container(
              width: double.infinity,
              height: 220,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.UploadImage),

                ),

                borderRadius: BorderRadius.circular(4),
              ),
            ),
            SizedBox(height: 140,),
            Align(
              alignment: Alignment.bottomCenter,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ReportsScreen()),
                    );
                  },
                  borderRadius: BorderRadius.circular(4),
                  splashColor: Colors.teal.withOpacity(0.3),
                  highlightColor: Colors.blueGrey.withOpacity(0.2),
                  child: Container(
                    margin: EdgeInsets.only(top: 16),
                    width: 305,
                    height: 40,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppAssets.CreateReport),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(
                        color: Color(0xFFD8D8D8),
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}