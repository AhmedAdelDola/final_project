import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:autism_app/Features/child_view/course/cubit/course_cubit.dart';
import 'package:autism_app/Features/child_view/course/cubit/course_state.dart';
import 'package:autism_app/Core/models/course_model.dart';
import 'dart:math';

class LettersScreen extends StatelessWidget {
  final String course;
  const LettersScreen({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CourseCubit()..fetchArCourses(course),
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FA),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black54),
            onPressed: () => Navigator.pop(context),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 4),
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 4),
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Letters',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.person,
                  color: Colors.blue,
                  size: 24,
                ),
              ),
            ),
          ],
        ),
        body: BlocBuilder<CourseCubit, CourseState>(
          builder: (context, state) {
            if (state is CourseLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CourseLoaded) {
              final List<CourseModel>? letters = state.courses;
              if (letters == null || letters.isEmpty) {
                return const Center(child: Text('No letters found.'));
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.85,
                  ),
                  itemCount: letters.length,
                  itemBuilder: (context, index) {
                    final letter = letters[index];
                    return LetterCard(
                      course: course,
                      index: index + 1,
                      letter: letter,
                      onTap: () {
                        _showLetterDialog(context, letter);
                      },
                    );
                  },
                ),
              );
            } else if (state is CourseError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  void _showLetterDialog(BuildContext context, CourseModel letter) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.teal.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      letter.letter ?? '',
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // You can add an emoji or image here if available
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Letter ${letter.letter ?? ''}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // Add more details if needed
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Navigate to lesson details if needed
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Start Lesson'),
            ),
          ],
        );
      },
    );
  }
}

class LetterCard extends StatelessWidget {
  final CourseModel letter;
  final String course;
  final int index;
  final VoidCallback onTap;

  static final List<Color> cardColors = [
    Color(0xFFBDE7CFCC),
    Color(0xFFFDDFC5CC),
    Color(0xFFA7EBFDB2),
    Color(0xFFC3C9FFB2),
    // Color(0xFFE0E7FF),
    // Color(0xFFFFE0F7),
    // Color(0xFFFFF0E0),
    // Color(0xFFE0FFF6),
    // Color(0xFFF0E0FF),
    // Color(0xFFFFE0E0),
  ];

  const LetterCard({
    Key? key,
    required this.letter,
    required this.onTap,
    required this.course,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Pick a color based on index for consistency
    final Color cardColor = cardColors[index % cardColors.length];

    return Directionality(
      textDirection: course == 'arabic' ? TextDirection.rtl : TextDirection.ltr,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            children: [
              // Header with lesson number
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      course == 'arabic' ? 'الدرس' : 'Lesson',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                          color: cardColor.withOpacity(80 / 100),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black.withOpacity(0.1),
                          )),
                      child: Center(
                        child: Text(
                          '${index}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Letter and image
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      letter.image ?? '',
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Text(
                        letter.letter ?? '',
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),
                    // You can show an image or emoji here if available
                  ],
                ),
              ),
              // Footer with letter name
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  '${course == 'arabic' ? 'حرف' : 'letter'} ${letter.letter ?? ''}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
