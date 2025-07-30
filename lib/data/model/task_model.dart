class TaskModel{
  final String id;
  final String title;
  final String description;
  final int priority;
  final DateTime data;
  TaskModel( {
    required this.id,
    required this.title,
    required this.description,
    required this.priority,
    required this.data});
  Map<String,dynamic>toJson(){
    return{
      "title":title,
      "description": description,
      "priority":priority,
      "data":data.millisecondsSinceEpoch
    };
  }
  factory TaskModel.fromJson(Map<String,dynamic> json, String id){
    return TaskModel(
      id: id,
      title: json["title"]as String? ?? "",
      description: json["description"]as String? ?? "",
      priority: json["priority"]as int? ?? 0,
      data:DateTime.fromMillisecondsSinceEpoch( json["data"]?? 0)
    );
  }
}
