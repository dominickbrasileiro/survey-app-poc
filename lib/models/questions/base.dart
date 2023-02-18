import '../../enums/enums.dart';

abstract class Question {
  final String id;
  final String title;
  final QuestionType type;
  final bool isRequired;
  final String? description;

  const Question({
    required this.id,
    required this.title,
    required this.type,
    required this.isRequired,
    this.description,
  });

  Map<String, dynamic> toBaseMap() => {
        "id": id,
        "title": title,
        "type": type.toString(),
        "isRequired": isRequired,
        "description": description,
      };

  Map<String, dynamic> toMap();
}

class Option {
  final String id;
  final String value;

  const Option({
    required this.id,
    required this.value,
  });

  Map<String, dynamic> toMap() => {
        "id": id,
        "value": value,
      };
}
