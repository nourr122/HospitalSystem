import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/gradient_container.dart';
import '../../../Login/presentation/views/Login.dart';

class prototypePage extends StatefulWidget {
  const prototypePage({super.key});

  @override
  prototypeState createState() => prototypeState();
}

var size, height, width;

class prototypeState extends State<prototypePage> {
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
        body: Stack(children: [
      const Align(
        alignment: Alignment.topLeft,
        child: GradientContainer(
          height: 280,
          width: 300,
          borderRadius: BorderRadius.only(topRight: Radius.circular(100)),
          colors: [AppColors.gradientColor1, AppColors.gradientColor2],
        ),
      ),
      const Align(
        alignment: Alignment.bottomRight,
        child: GradientContainer(
          height: 250,
          width: 280,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
          colors: [AppColors.gradientColor1, AppColors.gradientColor2],
        ),
      ),
      Center(
        child: SizedBox(
          height: height / 4,
          child:  Column(
            children: [
              const Text(
                'Prototype Map',
                style: TextStyle(fontSize: 30, color: AppColors.primaryColor, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: height/20,),

              Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,// gap between adjacent buttons
                runSpacing: 15, // gap between lines
                children: [
                  buildCustomButton('Doctor', widthFactor: 1.1),
                  buildCustomButton('Receptionist', widthFactor: 1.5),
                  buildCustomButton('Nurse', widthFactor: 0.9),
                  buildCustomButton('Analysis Employee', widthFactor: 2),
                  buildCustomButton('Manager', widthFactor: 0.9),
                  buildCustomButton('HR', widthFactor: 0.5),
                ],
              ),
            ],
          ),
        ),
      )
    ]));
  }
  Widget buildCustomButton(String specialist, {required double widthFactor}) {
    return SizedBox(
      width: 100 * widthFactor,
      height: 50,
      child: TextButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(specialist: specialist),
            ),
          );
        },
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primaryColor,
          side: const BorderSide(color: Color(0xfff707070), width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(specialist, textAlign: TextAlign.center),
      ),
    );
  }

}
