// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instant_project/core/network/dio_manager.dart';
import 'package:instant_project/core/ui/widgets/date_picker_widget.dart';
import 'package:instant_project/core/utils/app_assets.dart';
import 'package:instant_project/core/utils/app_colors.dart';
import 'package:instant_project/features/tasks/data/models/task_model.dart';
import 'package:instant_project/features/tasks/logic/tasks_cubit/tasks_cubit.dart';
import 'package:instant_project/features/tasks/presentation/screens/add_task_screen.dart';
import 'package:instant_project/features/tasks/presentation/screens/details_task_screen.dart';
import 'package:instant_project/features/tasks/presentation/widgets/task_item.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});
  static const id = '/tasks';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksCubit(),
      child: const _TasksScreen(),
    );
  }
}

class _TasksScreen extends StatefulWidget {
  const _TasksScreen();

  @override
  State createState() => _TasksScreenState();
}

class _TasksScreenState extends State<_TasksScreen> {
  @override
  void initState() {
    super.initState();

    DioManager.instance.setToken(
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNzZmMDc5ZDEwYTQwMmZjZDM1M2EzZjM5ZjFlZWI4MTY3MjgxYWZmYzQwMDg2YTRkYWVhYTRlNDJhYTI2MjI0ZDRiNjYyYzcyZmU1MmU2OGMiLCJpYXQiOjE3NDA3NDExNjcuMTM4Nzg3LCJuYmYiOjE3NDA3NDExNjcuMTM4Nzg5LCJleHAiOjE3NzIyNzcxNjcuMTM0NTE0LCJzdWIiOiIxMDgiLCJzY29wZXMiOltdfQ.ySEiaJYWosJtcml8n8Xf25Sl08-dIno1j7WOqi1Xkw6MV7o-L4SDbpPXRBY1gRm_GSFOzyOLsIeze2787ZUWVBEpzcQPjVn25LIRjPSw56OyFZMONITf2ITV6ql4scjPhG3l_ucJnzXYrMma04v8yrsiJnUqMrmUR9XQLDt1Nrs5IFhUIiBr2F2nYFqvexuLqXGopjxxRvuKM2BUt32gj-OoKYfV_r-e9kb4fAPUKZJBgL-JMH-TDwrgns69i6jFe6SWO8s85TSVAWg7IFoot6pngDwFhk8CU8P-6ZeqdVATav0Blq36zLmaUwCBPHH7bmiau_2IidLe6_K0t8tfavC80_i-ENFCh8KAjnSmDjXU4JvqOk6Icenco6PYNLDt13kbaM14u839XQOLoFe1-FaDChghrmAue0XlpsfXUCTYoVTAy4-hyNTEoxjNpS9F1CCzC5eC9oJ6S2xDLBv5BlJuNGfzvaP966uA1fzHC11tjBOJEFbGo5y9AnXcHmxTvdLS3eOk3MUfaaZxIZO2Ib1IIGCDPXmdBfzuz51cqILpLO64hrVF_dGzvuktdgY1ta6YEyRfQTyTAndyWeGRNEphX8LwG4dE4uAN99k8ppJn-52CTpc62k3Lf9lUqRuFgHJ2gWtxHpsr0RTu1z_7EWpOWa2QRNNockbx1OnV5rw');

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TasksCubit>().onDateChanged(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, TasksState>(
      builder: (context, state) {
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
                      onDateChanged: (date) {
                        context.read<TasksCubit>().onDateChanged(date);
                      },
                    ),
                  ),
                  IconButton(
                    icon: Image.asset(AppAssets.add),
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(
                        AddTaskScreen.id,
                      )
                          .then(
                        (value) {
                          context
                              .read<TasksCubit>()
                              .onDateChanged(DateTime.now());
                        },
                      );
                    },
                  ),
                ],
              ),
              Expanded(
                child: state.loading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      )
                    : state.tasks.isEmpty
                        ? const Center(
                            child: Text(
                            'No tasks added yet',
                            style: TextStyle(
                              fontSize: 24,
                              color: AppColors.textGreenColor,
                            ),
                          ))
                        : TasksListWidget(tasks: state.tasks),
              ),
            ],
          ),
        );
      },
    );
  }
}

class TasksListWidget extends StatelessWidget {
  const TasksListWidget({
    super.key,
    required this.tasks,
  });

  final List<TaskModel> tasks;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(
        top: 15,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
              DetailsTaskScreen.id,
              arguments: tasks[index],
            );
          },
          child: TaskItem(
            task: tasks[index],
          ),
        );
      },
      itemCount: tasks.length,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 15);
      },
    );
  }
}
