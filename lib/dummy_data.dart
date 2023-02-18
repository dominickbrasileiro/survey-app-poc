import 'models/models.dart';

const survey = Survey(
  id: "1",
  title: "Example Survey",
  description: "This is an example survey",
  questions: [
    QuestionYesNo(
      id: "1",
      title: "Have you ever used our product before?",
      isRequired: true,
    ),
    QuestionRadiogroup(
      id: "2",
      title: "How satisfied were you with our product?",
      isRequired: true,
      options: [
        Option(
          id: "1",
          value: "Very Satisfied",
        ),
        Option(
          id: "2",
          value: "Somewhat satisfied",
        ),
        Option(
          id: "3",
          value: "Not very satisfied",
        ),
        Option(
          id: "4",
          value: "Not at all satisfied",
        ),
      ],
    ),
    QuestionMultipleChoice(
      id: "3",
      title: "What did you like about our product?",
      isRequired: true,
      options: [
        Option(
          id: "1",
          value: "Easy to use",
        ),
        Option(
          id: "2",
          value: "Pricing",
        ),
        Option(
          id: "3",
          value: "Support",
        ),
      ],
    ),
    QuestionRating(
      id: "4",
      title: "How likely are you to recommend our product to a friend?",
      isRequired: true,
      minValue: 1,
      maxValue: 5,
      minLabel: "Not likely",
      maxLabel: "Very likely",
    ),
    QuestionText(
      id: "5",
      title: "Any comments?",
      isRequired: false,
    ),
  ],
);
