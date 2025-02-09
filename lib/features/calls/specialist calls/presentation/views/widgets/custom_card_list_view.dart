import 'package:flutter/material.dart';
import 'package:instant_project/core/components/custom_call_card.dart';
import 'package:instant_project/core/utils/app_assets.dart';
import 'package:instant_project/features/calls/specialist%20calls/data/models/list_tile_model.dart';

class CustomCardListView extends StatelessWidget {
   CustomCardListView({super.key});
  final List<CardModel> model = [
    CardModel(nameTitle: 'Ebrahem Khaled', callTime: '24.04.2021', icon: AppAssets.greenChecked),
    CardModel(nameTitle: 'Ebrahem Khaled', callTime: '24.04.2021', icon: AppAssets.callstime),
    CardModel(nameTitle: 'Ebrahem Khaled', callTime: '24.04.2021', icon: AppAssets.greenChecked),
    CardModel(nameTitle: 'Ebrahem Khaled', callTime: '24.04.2021', icon: AppAssets.callstime),
    CardModel(nameTitle: 'Ebrahem Khaled', callTime: '24.04.2021', icon: AppAssets.greenChecked),

  ]; 
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: model.length,
        itemBuilder:(context, index) {
          return CustomCallCard(
            doctorName: model[index].nameTitle, 
            icon: Image.asset(model[index].icon), 
            callTime: model[index].callTime, 
            );
        },
      ),
    );
  }
}