import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instant_project/core/ui/widgets/date_picker_widget.dart';
import 'package:instant_project/core/utils/app_assets.dart';
import 'package:instant_project/core/utils/app_colors.dart';
import 'package:instant_project/features/tasks/data/models/task_model.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.task,
  });

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  AppAssets.checkIconSVG,
                  width: 25,
                  height: 25,
                ),
                const SizedBox(width: 16),
                Text(task.name),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: task.status.color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    task.status.name,
                    style: TextStyle(
                      color: task.status.color,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                SvgPicture.asset(
                  AppAssets.calenderIconSVG,
                  width: 25,
                  height: 25,
                ),
                const SizedBox(width: 16),
                Text(
                  formateDate(task.date),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
