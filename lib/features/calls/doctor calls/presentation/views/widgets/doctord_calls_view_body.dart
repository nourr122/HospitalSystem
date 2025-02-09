import 'package:flutter/material.dart';
import 'package:instant_project/features/calls/doctor%20calls/presentation/views/widgets/custom_doctor_card_list_view.dart';

class DoctordCallsViewBody extends StatelessWidget {
  const DoctordCallsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [CustomDoctorCardListView()],
    );
  }
}
