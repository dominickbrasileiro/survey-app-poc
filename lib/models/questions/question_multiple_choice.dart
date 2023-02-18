import '../../enums/enums.dart';
import 'base.dart';

class QuestionMultipleChoice extends Question {
  final List<Option> options;

  const QuestionMultipleChoice({
    required super.id,
    required super.title,
    required super.isRequired,
    super.description,
    super.type = QuestionType.multipleChoice,
    required this.options,
  });

  @override
  Map<String, dynamic> toMap() => {
        ...toBaseMap(),
        "options": options.map((e) => e.toMap()).toList(),
      };
}
