import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instant_project/features/home/data/model/homeItemModel.dart';

class CustomContainer extends StatelessWidget {
  final HomeItemModel item;
  final double height;
  const CustomContainer({super.key, required this.item, required this.height});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: screenWidth*0.43,
      margin: const EdgeInsets.symmetric(vertical: 11),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: item.containerColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(item.iconUrl, height: 60, width: 60),
          const SizedBox(height: 13),
          Text(
            item.title,
            style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white),
          ),
          if (item.description != null) ...[
            const SizedBox(height: 5),
            Text(
              item.description!,
              style: GoogleFonts.poppins(fontSize: 11, color: Colors.white70),
            ),
          ],
        ],
      ),
    );
  }
}