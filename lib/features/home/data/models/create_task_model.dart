class CreateTaskModel {
  final String priority;
  final String image;
  final String desc;
  final String title;

  CreateTaskModel({
    required this.priority,
    required this.image,
    required this.desc,
    required this.title,
  });
  Map<String, dynamic> toJson() => {
    "priority": priority.toLowerCase(),
    "image": image,
    "desc": desc,
    "title": title,
  };
}
