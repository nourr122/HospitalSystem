// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instant_project/core/ui/widgets/app_button.dart';
import 'package:instant_project/core/ui/widgets/app_text_field.dart';
import 'package:instant_project/core/utils/app_assets.dart';
import 'package:instant_project/core/utils/app_colors.dart';
import 'package:instant_project/features/Employees/presentation/views/select_employe.dart';
import 'package:instant_project/features/tasks/logic/add_task/add_task_cubit.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});
  static const id = '/add_task';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskCubit(),
      child: const _AddTaskScreen(),
    );
  }
}

class _AddTaskScreen extends StatefulWidget {
  const _AddTaskScreen();

  @override
  State createState() => __AddTaskScreenState();
}

class __AddTaskScreenState extends State<_AddTaskScreen> {
  final Map<int, String> _toDoList = <int, String>{};

  TextEditingController employeeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTaskCubit, AddTaskState>(
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
                  AppTextField(
                    label: 'Task Name',
                    onChanged: (value) {
                      context.read<AddTaskCubit>().onNameChanged(value);
                    },
                  ),
                  const SizedBox(height: 15),
                  AppTextField(
                    label: 'Select Employee',
                    controller: employeeController,
                    icon: Icons.arrow_forward_ios,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) {
                          return SelectEmploye(
                            onEmployeeSelected: (p0) {
                              employeeController.text = p0['first_name'];
                              context.read<AddTaskCubit>().onEmployeeSelected(
                                    p0['id'].toString(),
                                  );
                              Navigator.pop(context);
                            },
                          );
                        },
                      ));
                    },
                    onChanged: (value) {
                      context.read<AddTaskCubit>().onEmployeeSelected(value);
                    },
                  ),
                  const SizedBox(height: 15),
                  AppTextField(
                    label: 'Description',
                    onChanged: (value) {
                      context.read<AddTaskCubit>().onDescriptionChanged(value);
                    },
                    maxLines: 5,
                  ),
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (_) {
                          return AddToDoSheet(
                            onAdd: (value) {
                              setState(() {
                                _toDoList[_toDoList.length + 1] = value;
                                context.read<AddTaskCubit>().onToDoAdded(value);
                              });
                            },
                          );
                        },
                      );
                    },
                    child: Row(
                      children: [
                        const Text('To do'),
                        const Spacer(),
                        Container(
                          margin: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: AppColors.white,
                            size: 19,
                          ),
                        ),
                        const Text('Add'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  ..._toDoList.entries.map(
                    (toDo) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _toDoList.remove(toDo.key);
                                  context
                                      .read<AddTaskCubit>()
                                      .onToDoRemoved(toDo.value);
                                });
                              },
                              child: SvgPicture.asset(
                                AppAssets.deleteIconSVG,
                                width: 30,
                                height: 30,
                              ),
                            ),
                            Expanded(child: Text(toDo.value)),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 35),
                  DottedBorder(
                    dashPattern: const [16, 16],
                    color: AppColors.gray,
                    strokeWidth: 1,
                    child: Container(
                      width: double.infinity,
                      height: 210,
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (state.file != null) Image.file(state.file!),
                          if (state.file == null)
                            Image.asset(AppAssets.uploadImage),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: 190,
                            child: AppButton(
                              text: 'Upload Image',
                              onPressed: () async {
                                FilePickerResult? result =
                                    await FilePicker.platform.pickFiles();

                                if (result != null) {
                                  File file = File(result.files.single.path!);
                                  context
                                      .read<AddTaskCubit>()
                                      .onImageChanged(file);
                                } else {}
                              },
                              secondry: true,
                              buttonColor: AppColors.pageBackground,
                              textColor: AppColors.primaryColor,
                              prefixIcon: const Icon(
                                Icons.add,
                                color: AppColors.primaryColor,
                                size: 19,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 45),
                  if (!state.loading)
                    AppButton(
                      disabled: !state.isDataValid,
                      text: 'Send',
                      onPressed: () async {
                        final result =
                            await context.read<AddTaskCubit>().onAddTask();

                        if (result) {
                          Navigator.of(context).pop(true);
                        }
                      },
                    ),
                  if (state.loading) const CircularProgressIndicator(),
                  const SizedBox(height: 30),
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
