import 'package:flutter/material.dart';
import 'package:instant_project/features/Splash/presentation/views/Splash.dart';

import 'features/tasks/data/models/task_model.dart';
import 'features/tasks/presentation/screens/add_task_screen.dart';
import 'features/tasks/presentation/screens/details_task_screen.dart';
import 'features/tasks/presentation/screens/tasks_screen.dart';

class AppRouter {
  AppRouter._();
  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Splash.id:
        return MaterialPageRoute(
            builder: (_) => const Splash(
                  title: 'Main',
                ));

      case TasksScreen.id:
        return MaterialPageRoute(builder: (_) => const TasksScreen());

      case AddTaskScreen.id:
        return MaterialPageRoute(builder: (_) => const AddTaskScreen());

      case DetailsTaskScreen.id:
        return MaterialPageRoute(
          builder: (_) => DetailsTaskScreen(
            task: routeSettings.arguments as TaskModel,
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${routeSettings.name}'),
            ),
          ),
        );
    }
  }
}
