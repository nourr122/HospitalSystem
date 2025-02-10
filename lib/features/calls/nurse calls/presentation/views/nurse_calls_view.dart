import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instant_project/core/utils/text_styles.dart';
import 'package:instant_project/features/calls/nurse%20calls/presentation/views/widgets/nurse_calls_view_body.dart';

class NurseCallsView extends StatelessWidget {
  const NurseCallsView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Calls',
          style: TextStyles.stylePoppinsRegular16PageTitle.copyWith(fontSize: 20.sp),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () { 
          Navigator.pop(context);
        },icon: const Icon(Icons.arrow_back),),
      ),
      body: const NurseCallsViewBody(),
    );
  }
}