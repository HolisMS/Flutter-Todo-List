class TodoModel {
  final String title;
  final String desc;
  final String date;

  TodoModel({
    this.title,
    this.desc,
    this.date,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      title: json['title'] == '' ? ' ' : json['title'],
      desc: json['description'],
      date: json['date'],
    );
  }
}
