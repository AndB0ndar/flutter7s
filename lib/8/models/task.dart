class Task {
  final int id;
  final String title;
  final String? description;
  final bool completed;
  final String? image;

  Task({required this.id, required this.title, this.description, this.completed = false, this.image});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      completed: json['completed'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'completed': completed,
      'image': image,
    };
  }
}
