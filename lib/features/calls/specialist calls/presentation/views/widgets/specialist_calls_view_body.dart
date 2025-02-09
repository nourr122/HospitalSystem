import 'package:flutter/material.dart';
import 'package:instant_project/features/calls/specialist%20calls/presentation/views/widgets/date_picker.dart';
import 'package:instant_project/features/calls/specialist%20calls/presentation/views/widgets/custom_card_list_view.dart';

class SpecialistCallsViewBody extends StatelessWidget {
  const SpecialistCallsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const DatePickerField(),
        CustomCardListView()
    ],);
  }
}