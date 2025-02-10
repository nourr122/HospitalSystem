import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instant_project/core/utils/text_styles.dart';
import 'package:instant_project/features/calls/doctor%20calls/presentation/views/widgets/doctord_calls_view_body.dart';

class DoctorCallsView extends StatelessWidget {
  const DoctorCallsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calls', style: TextStyles.stylePoppinsRegular16PageTitle.copyWith(fontSize: 20.sp),),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);

        },icon: const Icon(Icons.arrow_back)),
      ),
      backgroundColor: Colors.white,
      body: const DoctordCallsViewBody(),
    );
  }
}