import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instant_project/core/ui/widgets/app_button.dart';
import 'package:instant_project/core/ui/widgets/app_text_field.dart';
import 'package:instant_project/core/utils/app_assets.dart';
import 'package:instant_project/core/utils/app_colors.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({
    super.key,
  });

  static const id = '/add_task';

  @override
  State createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final Map<int, String> _toDoList = <int, String>{};

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
              AppTextField(
                label: 'Task Name',
                onChanged: (value) {},
              ),
              const SizedBox(height: 15),
              AppTextField(
                label: 'Select Employee',
                icon: Icons.arrow_forward_ios,
                onChanged: (value) {},
              ),
              const SizedBox(height: 15),
              AppTextField(
                label: 'Description',
                onChanged: (value) {},
                maxLines: 5,
              ),
              const SizedBox(height: 15),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return AddToDoSheet(
                        onAdd: (value) {
                          setState(() {
                            _toDoList[_toDoList.length + 1] = value;
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
                      Image.asset(
                        AppAssets.uploadImage,
                        // width: 25,
                        // height: 25,
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: 190,
                        child: AppButton(
                          text: 'Upload Image',
                          onPressed: () {},
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
              AppButton(
                text: 'Send',
                onPressed: () {},
              ),
              const SizedBox(height: 30),
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
