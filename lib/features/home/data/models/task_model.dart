import 'dart:convert';

class TaskModel {
  final String? id;
  final String? image;
  final String? title;
  final String? description;
  final String? priority;
  final String? status;
  final String? userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const TaskModel({
    this.id,
    this.image,
    this.title,
    this.description,
    this.priority,
    this.status,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  /// Factory constructor to create a TaskModel from JSON
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json["_id"] as String?,
      image: json["image"] as String?,
      title: json["title"] as String?,
      description: json["desc"] as String?,
      priority: json["priority"] as String?,
      status: json["status"] as String?,
      userId: json["user"] as String?,
      createdAt:
          json["createdAt"] != null
              ? DateTime.tryParse(json["createdAt"])
              : null,
      updatedAt:
          json["updatedAt"] != null
              ? DateTime.tryParse(json["updatedAt"])
              : null,
    );
  }

  /// Converts TaskModel to JSON format
  // Map<String, dynamic> toJson() {
  //   return {
  //     "_id": id,
  //     "image": image,
  //     "title": title,
  //     "desc": description,
  //     "priority": priority,
  //     "status": status,
  //     "user": userId,
  //     "createdAt": createdAt?.toIso8601String(),
  //     "updatedAt": updatedAt?.toIso8601String(),
  //   };
  // }

  /// Factory constructor to parse a list of tasks from JSON
  // static List<TaskModel> fromJsonList(String jsonString) {
  //   final List<dynamic> jsonData = json.decode(jsonString);
  //   return jsonData.map((json) => TaskModel.fromJson(json)).toList();
  // }
}
