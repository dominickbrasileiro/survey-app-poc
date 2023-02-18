import '../../enums/enums.dart';
import 'base.dart';

class QuestionRating extends Question {
  final int minValue;
  final int maxValue;
  final String? minLabel;
  final String? maxLabel;

  const QuestionRating({
    required super.id,
    required super.title,
    required super.isRequired,
    super.description,
    super.type = QuestionType.rating,
    required this.minValue,
    required this.maxValue,
    this.minLabel,
    this.maxLabel,
  });

  @override
  Map<String, dynamic> toMap() => {
        ...toBaseMap(),
        "minValue": minValue,
        "maxValue": maxValue,
        "minLabel": minLabel,
        "maxLabel": maxLabel,
      };
}
