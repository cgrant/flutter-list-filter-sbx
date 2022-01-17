class Todo {
  final int id;
  final String title;
  final bool completed;

  const Todo({
    required this.id,
    required this.completed,
    required this.title,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json['id'],
        title: json['title'],
        completed: json['completed'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'author': completed,
      };
}
