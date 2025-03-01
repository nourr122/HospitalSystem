class TodoModel {
  final int id;
  final String name;
  final bool isDone;

  TodoModel({
    required this.id,
    required this.name,
    required this.isDone,
  });

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'],
      name: map['title'],
      isDone: map['isDone'] ?? false,
    );
  }
}
