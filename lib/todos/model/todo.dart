class Todo {
  int? id;
  //description is the text we see on
  //main screen card text
  String description;
  //isDone used to mark what Todo item is completed
  bool isDone = false;
  //When using curly braces { } we note dart that
  //the parameters are optional
  Todo({this.id, required this.description, this.isDone = false});
  factory Todo.fromDatabaseJson(Map<String, dynamic> data) => Todo(
        id: data['id'],
        description: data['description'],
        isDone: data['is_done'] == 1,
      );
  Map<String, dynamic> toDatabaseJson() => {
        "description": this.description,
        "is_done": this.isDone == false ? 0 : 1,
      };
}
