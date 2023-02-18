import 'questions/base.dart';

class Survey {
  final String id;
  final String title;
  final String description;
  final List<Question> questions;

  const Survey({
    required this.id,
    required this.title,
    required this.description,
    required this.questions,
  });

  Map<String, dynamic> toMap() => {
        "id:": id,
        "title:": title,
        "description:": description,
        "questions:": questions.map((e) => e.toMap()).toList(),
      };
}
