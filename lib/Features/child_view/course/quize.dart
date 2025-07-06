import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:autism_app/Features/child_view/course/cubit/course_cubit.dart';
import 'package:autism_app/Features/child_view/course/cubit/course_state.dart';
import 'package:autism_app/Core/models/quizemodel.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  PageController _pageController = PageController();
  int currentPage = 0;
  List<String?> selectedAnswers = [];

  @override
  void initState() {
    super.initState();
    // Fetch quizzes when the screen is initialized
    context.read<CourseCubit>().fetchQuizzes();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseCubit, CourseState>(
      builder: (context, state) {
        if (state is quizLoading) {
          return Scaffold(
            backgroundColor: Colors.grey[50],
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (state is quizLoaded) {
          final List<QuizModel>? quizzes = state.quiz;
          if (quizzes == null || quizzes.isEmpty) {
            return Scaffold(
              backgroundColor: Colors.grey[50],
              body: Center(child: Text('No quizzes found.')),
            );
          }
          // Ensure selectedAnswers list matches quizzes length
          if (selectedAnswers.length != quizzes.length) {
            selectedAnswers = List<String?>.filled(quizzes.length, null);
          }
          return Scaffold(
            backgroundColor: Colors.grey[50],
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.pink[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Level 1',
                  style: TextStyle(
                    color: Colors.pink[400],
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: PageView.builder(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(),
                itemCount: quizzes.length,
                itemBuilder: (context, pageIndex) {
                  final quiz = quizzes[pageIndex];
                  return Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        quiz.content ?? 'What is that?',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              Colors.pink.withOpacity(0.3),
                              Colors.pink.withOpacity(0.1),
                              Colors.transparent,
                            ],
                          ),
                        ),
                        child: Center(
                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red[400],
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.red.withOpacity(0.3),
                                  blurRadius: 20,
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
                            child: quiz.questionPicture != null &&
                                    quiz.questionPicture!.isNotEmpty
                                ? Image.network(
                                    quiz.questionPicture!,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) => Icon(
                                            Icons.error,
                                            size: 50,
                                            color: Colors.red[700]),
                                  )
                                : Icon(Icons.image,
                                    size: 50, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Expanded(
                        child: Column(
                          children: [
                            ...(quiz.choices ?? []).map((option) => Padding(
                                  padding: const EdgeInsets.only(bottom: 15.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedAnswers[pageIndex] = option;
                                      });
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 18),
                                      decoration: BoxDecoration(
                                        color:
                                            selectedAnswers[pageIndex] == option
                                                ? Colors.grey
                                                : Colors.pink[400],
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.pink.withOpacity(0.3),
                                            blurRadius: 8,
                                            offset: Offset(0, 4),
                                          ),
                                        ],
                                      ),
                                      child: Text(
                                        option,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 18),
                        decoration: BoxDecoration(
                          color: Colors.pink[400],
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.pink.withOpacity(0.3),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: TextButton(
                          onPressed: () {
                            if (selectedAnswers[pageIndex] != null) {
                              if (pageIndex < quizzes.length - 1) {
                                _pageController.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                                setState(() {
                                  currentPage = pageIndex + 1;
                                });
                              } else {
                                // Quiz finished, handle results here
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text('Quiz Finished'),
                                    content:
                                        Text('You have completed the quiz!'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: Text('OK'),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            }
                          },
                          child: Text(
                            pageIndex < quizzes.length - 1 ? 'Next' : 'Finish',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        } else if (state is quizError) {
          return Scaffold(
            backgroundColor: Colors.grey[50],
            body: Center(child: Text(state.message)),
          );
        }
        return Scaffold(
          backgroundColor: Colors.grey[50],
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
