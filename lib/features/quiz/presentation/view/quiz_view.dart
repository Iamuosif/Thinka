import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:thinka/core/utils/app_colors.dart';
import 'package:thinka/features/summary/data/model/quiz_quistions_model.dart';

class QuizView extends StatefulWidget {
  final String result;
  const QuizView({super.key, required this.result});

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  final List<QuizQuistionsModel> questions = [
    QuizQuistionsModel(
      question: "What is the capital of Egypt?",
      options: ["Alexandria", "Cairo", "Luxor", "Aswan"],
      correctAnswerIndex: 1,
    ),
    QuizQuistionsModel(
      question: "What is the largest planet in our solar system?",
      options: ["Earth", "Mars", "Jupiter", "Saturn"],
      correctAnswerIndex: 2,
    ),
    QuizQuistionsModel(
      question: "What is the chemical symbol for water?",
      options: ["H2O", "CO2", "O2", "NaCl"],
      correctAnswerIndex: 0,
    ),
  ];
  int currentQuestionIndex = 0;
  int? selectedIndex;
  List<int?> selectedAnswers = [];
  @override
  void initState() {
    super.initState();
    selectedAnswers = List.filled(questions.length, null);
  }

  @override
  Widget build(BuildContext context) {
    final QuizQuistionsModel currentQuestion = questions[currentQuestionIndex];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz Time"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Question ${currentQuestionIndex + 1} of ${questions.length}",
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currentQuestion.question,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ...List.generate(currentQuestion.options.length, (index) {
                    final isSelected = selectedIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color:
                              isSelected
                                  ? AppColors.primary.withValues(alpha: 0.1)
                                  : Colors.white,
                          border: Border.all(
                            color:
                                isSelected
                                    ? AppColors.primary
                                    : Colors.grey[300]!,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              isSelected
                                  ? Icons.radio_button_checked
                                  : Icons.radio_button_off,
                              color:
                                  isSelected ? AppColors.primary : Colors.grey,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                currentQuestion.options[index],
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed:
                  selectedIndex == null
                      ? null
                      : () {
                        // Always save the current answer first
                        selectedAnswers[currentQuestionIndex] = selectedIndex;

                        if (currentQuestionIndex < questions.length - 1) {
                          setState(() {
                            currentQuestionIndex++;
                            selectedIndex =
                                selectedAnswers[currentQuestionIndex];
                          });
                        } else {
                          // Now calculate score
                          int correct = 0;
                          for (int i = 0; i < questions.length; i++) {
                            if (selectedAnswers[i] ==
                                questions[i].correctAnswerIndex) {
                              correct++;
                            }
                          }

                          // Show score in dialog
                          Future.microtask(() {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder:
                                  (_) => ScoreDialog(
                                    correct: correct,
                                    total: questions.length,
                                  ),
                            );
                          });
                        }
                      },

              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: Text(
                currentQuestionIndex < questions.length - 1 ? "Next" : "Submit",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScoreDialog extends StatefulWidget {
  final int correct;
  final int total;

  const ScoreDialog({super.key, required this.correct, required this.total});

  @override
  State<ScoreDialog> createState() => _ScoreDialogState();
}

class _ScoreDialogState extends State<ScoreDialog> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(
      duration: const Duration(seconds: 2),
    );

    final double scorePercent = widget.correct / widget.total;

    if (scorePercent >= 0.7) {
      _confettiController.play();
    }
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isPerfect = widget.correct == widget.total;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.white,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("🎉", style: TextStyle(fontSize: 48)),
                const SizedBox(height: 16),
                const Text(
                  "You scored",
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
                const SizedBox(height: 8),
                Text(
                  "${widget.correct} / ${widget.total}",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  widget.correct == widget.total
                      ? "Perfect! 🧠"
                      : (widget.correct >= widget.total / 2
                          ? "Great job! 👏"
                          : "Keep practicing! 💪"),
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(AppColors.primary),
                  ),
                  child: const Text(
                    "Back to Home",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),

          // 🎊 Confetti on top!
          ConfettiWidget(
            confettiController: _confettiController,
            blastDirectionality: BlastDirectionality.explosive,
            shouldLoop: false,
            emissionFrequency: 0.1,
            numberOfParticles: 20,
            maxBlastForce: 10,
            minBlastForce: 5,
            gravity: 0.2,
          ),
        ],
      ),
    );
  }
}
