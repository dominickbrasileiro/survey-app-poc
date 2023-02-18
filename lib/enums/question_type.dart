enum QuestionType {
  multipleChoice,
  radiogroup,
  rating,
  text,
  yesNo,
  unknown;

  static QuestionType fromString(String s) {
    switch (s) {
      case "multiple_choice":
        return QuestionType.multipleChoice;
      case "radiogroup":
        return QuestionType.radiogroup;
      case "rating":
        return QuestionType.rating;
      case "text":
        return QuestionType.text;
      case "yes_no":
        return QuestionType.yesNo;
      default:
        return QuestionType.unknown;
    }
  }

  @override
  String toString() {
    switch (this) {
      case QuestionType.multipleChoice:
        return "multiple_choice";
      case QuestionType.radiogroup:
        return "radiogroup";
      case QuestionType.rating:
        return "rating";
      case QuestionType.text:
        return "text";
      case QuestionType.yesNo:
        return "yes_no";
      case QuestionType.unknown:
        return "unknown";
      default:
        return name;
    }
  }
}
