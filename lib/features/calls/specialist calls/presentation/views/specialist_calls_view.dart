import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instant_project/core/utils/text_styles.dart';
import 'package:instant_project/features/calls/specialist%20calls/presentation/views/widgets/specialist_calls_view_body.dart';

class SpecialistCallsView extends StatelessWidget {
  const SpecialistCallsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Calls',
            style: TextStyles.stylePoppinsRegular16PageTitle
                .copyWith(fontSize: 22.sp),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: const SpecialistCallsViewBody());
  }
}
