import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instant_project/core/ui/widgets/app_button.dart';
import 'package:instant_project/core/ui/widgets/app_text_field.dart';
import 'package:instant_project/core/ui/widgets/dashed_line_painter.dart';
import 'package:instant_project/core/ui/widgets/date_picker_widget.dart';
import 'package:instant_project/core/utils/app_assets.dart';
import 'package:instant_project/core/utils/app_colors.dart';
import 'package:instant_project/features/tasks/data/models/task_model.dart';
import 'package:instant_project/features/tasks/logic/task_details_cubit/task_details_cubit.dart';

class DetailsTaskScreen extends StatelessWidget {
  const DetailsTaskScreen({
    super.key,
    required this.task,
  });
  static const id = '/details_task';
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskDetailsCubit(),
      child: _DetailsTaskScreen(taskDetails: task),
    );
  }
}

class _DetailsTaskScreen extends StatefulWidget {
  const _DetailsTaskScreen({
    required this.taskDetails,
  });

  final TaskModel taskDetails;

  @override
  State createState() => __DetailsTaskScreenState();
}

class __DetailsTaskScreenState extends State<_DetailsTaskScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<TaskDetailsCubit>().onIdChanged(widget.taskDetails.id);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskDetailsCubit, TaskDetailsState>(
      builder: (context, state) {
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
                      state.task?.name ?? '',
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                      state.task?.createdAt ?? DateTime.now(),
                                      format: 'dd MMM yyyy',
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Details Note: ${state.task?.description}',
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
                              ...(state.task?.toDoList ?? []).map(
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
                                            borderRadius:
                                                BorderRadius.circular(18),
                                            border: !toDo.isDone
                                                ? Border.all(
                                                    color:
                                                        AppColors.primaryColor,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                        state.task?.createdAt ?? DateTime.now(),
                                        format: 'dd MMM yyyy',
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Details Note: ${state.task?.description}',
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
      },
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
