import 'package:flutter/material.dart';
import 'package:instant_project/features/calls/constants.dart';
import 'package:instant_project/features/calls/nurse%20calls/presentation/views/widgets/custom_nurse_card_list_view.dart';

class NurseCallsViewBody extends StatelessWidget {
  const NurseCallsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomNurseCardListView(doctorName: 'Dr. Salma Ali', token: nurseToken,)
      ],
    );
  }
}