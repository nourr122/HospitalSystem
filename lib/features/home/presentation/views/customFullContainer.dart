import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/model/homeItemModel.dart';

class CustomFullContainer extends StatelessWidget {
  final HomeItemModel item;
  const CustomFullContainer({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130,
      margin: const EdgeInsets.symmetric(horizontal: 4,vertical: 6),
      padding: const EdgeInsets.all(19),
      decoration: BoxDecoration(
        color: item.containerColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
          SvgPicture.asset(item.iconUrl, height: 60, width: 60),
        ],
      ),
    );
  }
}