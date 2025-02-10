import 'package:flutter/material.dart';
import 'package:instant_project/core/components/custom_call_card.dart';
import 'package:instant_project/core/utils/text_styles.dart';
import 'package:instant_project/features/calls/doctor%20calls/presentation/views/widgets/call_details.dart';
import 'package:instant_project/core/components/custom_calls_buttons.dart';

class CustomDoctorCardListView extends StatelessWidget {
  const CustomDoctorCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Expanded(
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return CustomCallCard(
            doctorName: 'Ebrahem Khaled', 
            callTime: '24.0.2021',
            buttons: Column(
              children: [
                SizedBox(
                  height: height / 40 ,
                ),
                const CustomCallsButtons(),
                SizedBox(
                  height: height / 54,
                )
              ],
            ),
            onTap: () {
               Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CallDetails(
                titleName: 'Shawky Ahmed',
                subtitle: 'Specialist - Manager',
                body: Text(
                  'Details note : Lorem Ipsum is simply dummy text of printing and typesetting industry.Lorem Ipsum',
                  style: TextStyles.stylePoppinsMedium14Title,
                ),
              ),
            ),
          );
            },
            );
        },
      ),
    );
  }
}
