import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/widgets/gradient_container.dart';
import '../../../Login/presentation/views/Login.dart';
import '../../../prototype/presentation/views/prototype.dart';

class Splash extends StatefulWidget{
  const Splash({super.key, required this.title});

  final String title;


  @override
  State<Splash> createState() => _Splash();
}

class _Splash extends State<Splash>  with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;
  var size,height,width;


 @override
  void initState() {
   super.initState();
   _controller = AnimationController(
     duration: const Duration(seconds: 5),
     vsync: this,
   );

   _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
     ..addListener(() {
       setState(() {});
     })
    ..addStatusListener((status) {
   if (status == AnimationStatus.completed) {
     Navigator.pushReplacement(
       context,
       MaterialPageRoute(
         builder: (context) => prototypePage(),
       ),
     );
   }
   });

   _controller.forward();
 }

 @override
 void dispose() {
   _controller.dispose();
   super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
   return Scaffold(
     backgroundColor: Colors.white,
    body: Stack(
       children: [
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
         SizedBox(
           height: height * 1.1,
           child: Center(
             child: Column(
               mainAxisSize: MainAxisSize.min,
               children: [
                 Image.asset(
                   AppAssets.logo2,
                   height: 250,
                 ),
                 SizedBox(height: height * 0.2),
                 SizedBox(
                   width: width * 0.8,
                   child: LinearProgressIndicator(
                     value: _animation.value,
                     backgroundColor: const Color(0xFFF4F6466),
                     valueColor:
                     const AlwaysStoppedAnimation(AppColors.primaryColor),
                     minHeight: 5,
                   ),
                 ),
                 SizedBox(height: 20),
                 // Loading Text
                 const Text(
                   'Loading...',
                   style: TextStyle(fontSize: 20, color: AppColors.primaryColor, fontWeight: FontWeight.bold),
                 ),

               ],
             ),
           ),

         ),

       ],
     ),
   );

  }
}

