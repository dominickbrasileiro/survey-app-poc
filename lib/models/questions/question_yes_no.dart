import '../../enums/enums.dart';
import 'base.dart';

class QuestionYesNo extends Question {
  const QuestionYesNo({
    required super.id,
    required super.title,
    required super.isRequired,
    super.description,
    super.type = QuestionType.yesNo,
  });

  @override
  Map<String, dynamic> toMap() => {
        ...toBaseMap(),
      };
}
