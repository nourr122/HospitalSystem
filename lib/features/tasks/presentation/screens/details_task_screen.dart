import 'package:flutter/material.dart';
import 'package:instant_project/core/ui/widgets/app_button.dart';
import 'package:instant_project/core/ui/widgets/app_text_field.dart';
import 'package:instant_project/core/ui/widgets/dashed_line_painter.dart';
import 'package:instant_project/core/ui/widgets/date_picker_widget.dart';
import 'package:instant_project/core/utils/app_assets.dart';
import 'package:instant_project/core/utils/app_colors.dart';
import 'package:instant_project/features/tasks/data/models/task_model.dart';

class DetailsTaskScreen extends StatefulWidget {
  const DetailsTaskScreen({
    super.key,
    required this.task,
  });

  static const id = '/details_task';

  final TaskModel task;

  @override
  State createState() => _DetailsTaskScreenState();
}

class _DetailsTaskScreenState extends State<DetailsTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Task Details'),
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.gray.withAlpha(30),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
                child: Text(
                  widget.task.name,
                  style: const TextStyle(fontSize: 15),
                ),
              ),
              const SizedBox(height: 30),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: double.infinity,
                      width: 2,
                      color: AppColors.gray,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(width: 10),
                              Image.asset(
                                AppAssets.profileImage,
                                width: 40,
                                height: 40,
                              ),
                              const SizedBox(width: 15),
                              const Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Shawky Ahmend',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 1),
                                    Text(
                                      'Specialist - Manger',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                formateDate(
                                  widget.task.date,
                                  format: 'dd MMM yyyy',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Details Note: ${widget.task.description}',
                            ),
                          ),
                          SizedBox(
                            height: 190,
                            width: 210,
                            child: Image.asset(
                              AppAssets.noteImage,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomPaint(
                      size: const Size(2, double.infinity),
                      painter: DashedLineVerticalPainter(),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'To do',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          ...widget.task.toDoList.map(
                            (toDo) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 10),
                                    Container(
                                      width: 26,
                                      height: 26,
                                      decoration: BoxDecoration(
                                        color: toDo.isDone
                                            ? AppColors.primaryColor
                                            : AppColors.white,
                                        borderRadius: BorderRadius.circular(18),
                                        border: !toDo.isDone
                                            ? Border.all(
                                                color: AppColors.primaryColor,
                                                width: 1,
                                              )
                                            : null,
                                      ),
                                      child: toDo.isDone
                                          ? const Icon(
                                              Icons.check,
                                              color: AppColors.white,
                                              size: 18,
                                            )
                                          : null,
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(child: Text(toDo.name)),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              AppTextField(
                label: 'Add note',
                onChanged: (value) {},
                maxLines: 4,
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Icon(Icons.reply_outlined),
                  SizedBox(width: 10),
                  Text('Reply - Donctor'),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: double.infinity,
                        width: 2,
                        color: AppColors.gray,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(width: 10),
                                Image.asset(
                                  AppAssets.profileImage,
                                  width: 40,
                                  height: 40,
                                ),
                                const SizedBox(width: 15),
                                const Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Shawky Ahmend',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 1),
                                      Text(
                                        'Specialist - Manger',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  formateDate(
                                    widget.task.date,
                                    format: 'dd MMM yyyy',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Details Note: ${widget.task.description}',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              AppButton(
                text: 'Excution',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddToDoSheet extends StatefulWidget {
  const AddToDoSheet({
    super.key,
    required this.onAdd,
  });

  final ValueChanged<String> onAdd;

  @override
  State<AddToDoSheet> createState() => _AddToDoSheetState();
}

class _AddToDoSheetState extends State<AddToDoSheet> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.all(13),
          color: AppColors.gray.withAlpha(50),
          height: 3,
          width: 80,
        ),
        Container(
          margin: const EdgeInsets.all(15),
          child: AppTextField(
            label: 'To do details',
            controller: _controller,
            onChanged: (value) {},
            maxLines: 4,
          ),
        ),
        AppButton(
          text: 'Add',
          onPressed: () {
            if (_controller.text.isEmpty) {
              return;
            }
            widget.onAdd(_controller.text);
            Navigator.of(context).pop();
          },
        ),
        const SizedBox(
          height: 40,
        )
      ],
    );
  }
}
