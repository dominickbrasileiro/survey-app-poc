import '../../enums/enums.dart';
import 'base.dart';

class QuestionRadiogroup extends Question {
  final List<Option> options;

  const QuestionRadiogroup({
    required super.id,
    required super.title,
    required super.isRequired,
    super.description,
    super.type = QuestionType.radiogroup,
    required this.options,
  });

  @override
  Map<String, dynamic> toMap() => {
        ...toBaseMap(),
        "options": options.map((e) => e.toMap()).toList(),
      };
}
