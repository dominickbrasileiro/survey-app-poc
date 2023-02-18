import '../../enums/enums.dart';
import 'base.dart';

class QuestionText extends Question {
  const QuestionText({
    required super.id,
    required super.title,
    required super.isRequired,
    super.description,
    super.type = QuestionType.text,
  });

  @override
  Map<String, dynamic> toMap() => {
        ...toBaseMap(),
      };
}
