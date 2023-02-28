import 'dart:convert';

import 'package:flutter/material.dart';

import 'dummy_data.dart';
import 'extensions/extensions.dart';
import 'models/models.dart';

void main() {
  // ignore: avoid_print
  print("--------- SURVEY JSON ---------");
  // ignore: avoid_print
  print(jsonEncode(survey.toMap()));
  // ignore: avoid_print
  print("-------------------------------");

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int questionIndex = 0;
  bool finished = false;

  void nextQuestion() {
    if (questionIndex == survey.questions.length - 1) {
      finished = true;
      setState(() {});
    } else {
      questionIndex++;
      setState(() {});
    }
  }

  void reset() {
    questionIndex = 0;
    finished = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = survey.questions[questionIndex];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Survey App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Pesquisa #147"),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text("Dominick Brasileiro"),
                accountEmail: Text("brasileiro.dominick@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage:
                      NetworkImage("https://github.com/dominickbrasileiro.png"),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Visão Geral"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.event_note),
                title: const Text("Minhas Pesquisas"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Configurações"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text("Sair do APP"),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: finished
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Thank you!"),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: reset,
                        child: const Text("Reset"),
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(currentQuestion.title),
                      const SizedBox(height: 20),
                      if (currentQuestion is QuestionMultipleChoice)
                        Column(
                          children: currentQuestion.options
                              .map(
                                (o) => Row(
                                  children: [
                                    Checkbox(
                                      value: false,
                                      onChanged: (v) {},
                                    ),
                                    Text(o.value),
                                  ],
                                ),
                              )
                              .toList(),
                        ),
                      if (currentQuestion is QuestionRadiogroup)
                        Column(
                          children: currentQuestion.options
                              .mapIndexed(
                                (idx, option) => Row(
                                  children: [
                                    Radio(
                                      groupValue: idx,
                                      value: 0,
                                      onChanged: (v) {},
                                    ),
                                    Text(option.value),
                                  ],
                                ),
                              )
                              .toList(),
                        ),
                      if (currentQuestion is QuestionRating)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (var i = currentQuestion.minValue;
                                i <= currentQuestion.maxValue;
                                i++)
                              Expanded(
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      top: const BorderSide(),
                                      right: const BorderSide(),
                                      bottom: const BorderSide(),
                                      left: i == currentQuestion.minValue
                                          ? const BorderSide()
                                          : BorderSide.none,
                                    ),
                                  ),
                                  child: Text(
                                    "$i",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      if (currentQuestion is QuestionText) const TextField(),
                      if (currentQuestion is QuestionYesNo)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Text("No"),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Text("Yes"),
                              ),
                            ),
                          ],
                        ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: nextQuestion,
                              child: const Text("Next"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
