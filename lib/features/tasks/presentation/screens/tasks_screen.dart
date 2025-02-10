import 'package:flutter/material.dart';
import 'package:instant_project/core/ui/widgets/date_picker_widget.dart';
import 'package:instant_project/core/utils/app_assets.dart';
import 'package:instant_project/core/utils/app_colors.dart';
import 'package:instant_project/features/tasks/data/models/task_model.dart';
import 'package:instant_project/features/tasks/presentation/screens/add_task_screen.dart';
import 'package:instant_project/features/tasks/presentation/screens/details_task_screen.dart';
import 'package:instant_project/features/tasks/presentation/widgets/task_item.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({
    super.key,
  });

  static const id = '/tasks';

  @override
  State createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Tasks'),
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: DatePickerWidget(
                  onDateChanged: (date) {},
                ),
              ),
              IconButton(
                icon: Image.asset(AppAssets.add),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AddTaskScreen.id,
                  );
                },
              ),
            ],
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(
                top: 15,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      DetailsTaskScreen.id,
                      arguments: testTasks[index],
                    );
                  },
                  child: TaskItem(
                    task: testTasks[index],
                  ),
                );
              },
              itemCount: testTasks.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 15);
              },
            ),
          ),
        ],
      ),
    );
  }
}
