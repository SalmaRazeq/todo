class TodoDM {
  static const String collectionName = 'todo';
  String id;
  String taskTitle;
  String description;
  DateTime dateTime; //timeStamp
  bool isDone;

  TodoDM(
      {required this.id, required this.taskTitle, required this.description, required this.dateTime, required this.isDone});

  Map<String, dynamic> toFireStore() =>
      {
        'id': id,
        'taskTitle': taskTitle,
        'description': description,
        'dateTime': dateTime,
        'isDone': isDone
      };

  TodoDM.fromFireStore(Map<String, dynamic> data) : this(
  id : data['id'],
  taskTitle : data['taskTitle'],
  description : data['description'],
  dateTime : data['dateTime'].toDate(),
  isDone : data['isDone']
  );
}