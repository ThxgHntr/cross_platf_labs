import 'package:flutter/material.dart';

class Lab6View extends StatefulWidget {
  const Lab6View({super.key});

  static const String routeName = '/lab6';
  static const String image = 'assets/icons/quiz.png';

  @override
  State<Lab6View> createState() => _Lab6State();
}

class Question {
  String questionText;
  bool questionAnswer;

  Question(this.questionText, this.questionAnswer);
}

class QuizGenerator {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question('The earth is round.', true),
    Question('The sun rises in the west.', false),
    Question('Water freezes at 0°C.', true),
    Question('Humans have four lungs.', false),
    Question('Octopuses have three hearts.', true),
    Question('Lightning never strikes the same place twice.', false),
    Question('Bananas are berries.', true),
    Question('Goldfish have a three-second memory.', false),
    Question('The Great Wall of China is visible from space.', false),
    Question('Sharks are mammals.', false),
    Question('The human body has 206 bones.', true),
    Question('Sound travels faster in air than in water.', false),
    Question('A day on Venus is longer than a year on Venus.', true),
    Question('Bulls get angry when they see the color red.', false),
    Question('Honey never spoils.', true),
    Question('The capital of Australia is Sydney.', false),
    Question('Mount Everest is the tallest mountain on Earth.', true),
    Question('Glass is a solid material.', false),
    Question('Penguins can fly.', false),
    Question('The human heart beats around 100,000 times a day.', true),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}

class _Lab6State extends State<Lab6View> {
  List<Icon> score = [];
  QuizGenerator quizGenerator = QuizGenerator();
  int correctAnswers = 0;
  bool quizFinished = false;

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizGenerator.getCorrectAnswer();

    setState(() {
      if (quizGenerator.isFinished() == true) {
        quizFinished = true;
      } else {
        if (userPickedAnswer == correctAnswer) {
          score.add(const Icon(
            Icons.check,
            color: Colors.green,
          ));
          correctAnswers++;
        } else {
          score.add(const Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizGenerator.nextQuestion();
      }
    });
  }

  void restartQuiz() {
    setState(() {
      quizGenerator.reset();
      score = [];
      correctAnswers = 0;
      quizFinished = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.pink[800]
            : Colors.pinkAccent[100],
        title: Row(
          children: [
            Image.asset(
              Lab6View.image,
              width: 32,
              height: 32,
            ),
            const SizedBox(width: 8),
            // responsive text color
            Text(
              'Lab 6 - Quizzler',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  quizGenerator.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            Wrap(
              children: score,
            ),
            Text(
              'Correct: $correctAnswers / ${quizGenerator._questionBank.length}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            if (quizFinished)
              Expanded(
                child: TextButton(
                  onPressed: restartQuiz,
                  child: Container(
                    color: Colors.blue,
                    child: const Center(
                      child: Text(
                        'Restart',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            else ...[
              Expanded(
                child: TextButton(
                  onPressed: () {
                    checkAnswer(true);
                  },
                  child: Container(
                    color: Colors.green,
                    child: const Center(
                      child: Text(
                        'True',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    checkAnswer(false);
                  },
                  child: Container(
                    color: Colors.red,
                    child: const Center(
                      child: Text(
                        'False',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
