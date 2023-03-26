import 'package:flutter/material.dart';
import 'package:eco_reward_app/routes.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/style/default_theme.dart';

class MBTITestScreen extends StatefulWidget {
  const MBTITestScreen({Key? key}) : super(key: key);

  @override
  _MBTITestScreenState createState() => _MBTITestScreenState();
}

class _MBTITestScreenState extends State<MBTITestScreen> {
  int _currentQuestionIndex = 0;

  Map<String, int> mbtiWeights = {
    'I': 0,
    'E': 0,
    'N': 0,
    'S': 0,
    'T': 0,
    'F': 0,
    'J': 0,
    'P': 0,
  };
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Do you prefer working alone or as part of a team?',
      'answers': [
        {
          'text': 'I prefer working alone.',
          'weights': {'I': 1},
        },
        {
          'text': 'I prefer working in a team.',
          'weights': {'E': 1},
        },
        {
          'text': "I don't mind either way.",
          'weights': {'I': 1, 'E': 1},
        },
        {
          'text': "It depends on the situation.",
          'weights': {'I': 1, 'E': 1},
        },
      ],
    },
    {
      'question': 'Do you enjoy taking risks or do you prefer playing it safe?',
      'answers': [
        {
          'text': 'I enjoy taking risks.',
          'weights': {'E': 1},
        },
        {
          'text': 'I prefer playing it safe.',
          'weights': {'I': 1},
        },
        {
          'text': "I don't mind either way.",
          'weights': {'I': 1, 'E': 1},
        },
        {
          'text': "It depends on the situation.",
          'weights': {'I': 1, 'E': 1},
        },
      ],
    },
    {
      'question':
          'Do you prefer working with concrete, tangible things or with abstract concepts and ideas?',
      'answers': [
        {
          'text': 'I prefer working with concrete, tangible things.',
          'weights': {'S': 1},
        },
        {
          'text': 'I prefer working with abstract concepts and ideas.',
          'weights': {'N': 1},
        },
        {
          'text': "I enjoy working with both equally.",
          'weights': {'S': 1, 'N': 1},
        },
        {
          'text': "It depends on the situation.",
          'weights': {'S': 1, 'N': 1},
        },
      ],
    },
    {
      'question': 'How do you usually approach a new situation or project?',
      'answers': [
        {
          'text': 'I dive right in and figure it out as I go along.',
          'weights': {'P': 1},
        },
        {
          'text': 'I prefer to plan everything out before starting.',
          'weights': {'J': 1},
        },
        {
          'text':
              "I like to have some idea of what I'm doing, but I'm also open to improvising.",
          'weights': {'P': 1, 'J': 1},
        },
        {
          'text': 'It depends on the situation.',
          'weights': {'P': 1, 'J': 1},
        },
      ],
    },
    {
      'question':
          'How do you typically handle conflict or disagreements with others?',
      'answers': [
        {
          'text':
              "I prefer to address the conflict head-on and work towards a resolution.",
          'weights': {'T': 1},
        },
        {
          'text': "I prefer to avoid conflict and try to find a compromise.",
          'weights': {'F': 1},
        },
        {
          'text': "I don't mind either way.",
          'weights': {'T': 1, 'F': 1},
        },
        {
          'text': "It depends on the situation.",
          'weights': {'T': 1, 'F': 1},
        },
      ],
    },
    {
      'question': 'What type of work environment do you prefer?',
      'answers': [
        {
          'text':
              'I like a fast-paced, high-energy environment with lots of stimulation.',
          'weights': {'E': 1},
        },
        {
          'text':
              'I prefer a quiet, low-key environment with minimal distractions.',
          'weights': {'I': 1},
        },
        {
          'text': "I don't mind either way.",
          'weights': {'E': 1, 'I': 1},
        },
        {
          'text': "It depends on the situation.",
          'weights': {'E': 1, 'I': 1},
        },
      ]
    },
    {
      'question':
          'How do you feel about engaging in outdoor activities, such as tree planting or participating in a conservation challenge?',
      'answers': [
        {
          'text': "I love being outdoors and getting my hands dirty.",
          'weights': {'S': 1},
        },
        {
          'text':
              "I don't mind outdoor activities, but I prefer ones that are less physically demanding.",
          'weights': {'N': 1},
        },
        {
          'text':
              "I like the idea of outdoor activities, but I haven't done much of it before.",
          'weights': {'S': 1, 'N': 1},
        },
        {
          'text': "I'm not really interested in outdoor activities.",
          'weights': {'S': 1, 'N': 1},
        },
      ]
    },
  ];

  void _selectAnswer(int questionIndex, int answerIndex) {
    final answerWeights =
        _questions[questionIndex]['answers'][answerIndex]['weights'];

    setState(() {
      mbtiWeights.updateAll((key, value) {
        if (answerWeights[key] == null) {
          return value;
        } else {
          return answerWeights[key].toInt() + value;
        }
      });

      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        // TODO: Navigate to the results screen with the selected answers.
        print(mbtiWeights);
        // String mbtiType = '';
        // mbtiWeights.forEach((letter, weight) {
        //   if (weight > 0) {
        //     mbtiType += letter;
        //   } else {
        //     mbtiType += letter.toLowerCase();
        //   }
        // });
        Navigator.pushNamed(context, Routes.tutorial);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentQuestionIndex]['question'];
    final answers = _questions[_currentQuestionIndex]['answers'];

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [ColorUtils.primary, ColorUtils.subBlue],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              question,
              style: defaultTheme.textTheme.titleMedium!.copyWith(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            ...List.generate(
              answers.length,
              (index) => ElevatedButton(
                onPressed: () => _selectAnswer(_currentQuestionIndex, index),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: Colors.white,
                ),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(answers[index]['text'],
                      style: defaultTheme.textTheme.bodyMedium!.copyWith(
                        fontSize: 16,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
