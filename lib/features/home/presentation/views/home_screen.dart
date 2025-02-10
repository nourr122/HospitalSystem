import 'package:flutter/material.dart';
import 'package:instant_project/core/ui/widgets/app_button.dart';
import 'package:instant_project/core/utils/app_assets.dart';
import 'package:instant_project/core/utils/app_colors.dart';
import 'package:instant_project/features/requests/presentation/views/requests_screen.dart';
import 'package:instant_project/features/tasks/presentation/screens/tasks_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  static const id = '/home';

  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: AppColors.primaryColor,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  TasksScreen.id,
                );
              },
              text: 'open Tasks screen',
            ),
            AppButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  RequestsScreen.id,
                );
              },
              text: 'open Requests screen',
            ),
            const AppButton(
              disabled: true,
              text: 'disabled Button sample',
            ),
            const AppButton(
              text: 'Button with icon sample',
              icon: AppAssets.add,
              buttonColor: AppColors.red,
            ),
          ],
        ),
      ),
    );
  }
}
