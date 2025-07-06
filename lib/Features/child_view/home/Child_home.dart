import 'package:autism_app/Features/child_view/course/course.dart';
import 'package:autism_app/Features/child_view/course/number.dart';
import 'package:autism_app/Features/child_view/course/quize.dart';
import 'package:autism_app/Features/child_view/home/cubit/child_profile_cubit.dart';
import 'package:autism_app/Features/child_view/home/cubit/child_profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChildHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChildInfoCubit()..fetchChildProfile(),
      child: BlocBuilder<ChildInfoCubit, ChildInfoState>(
        builder: (context, state) {
          String name = 'Loading...';
          String? age = '';
          int level = 1;
          int coins = 0;
          String? picture;

          if (state is ChildProfileLoaded && state.profile != null) {
            name = state.profile!.fullName ?? 'No Name';
            // You can calculate age from birthDate if needed
            level = state.profile!.level ?? 1;
            coins = state.profile!.coins ?? 0;
            age = state.profile!.birthDate != null
                ? (DateTime.now()
                            .difference(
                                DateTime.parse(state.profile!.birthDate!))
                            .inDays ~/
                        365)
                    .toString()
                : 'Age not available';
            picture = state.profile!.picture;
          } else if (state is ChildProfileLoading) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          } else if (state is ChildProfileError) {
            name = 'Error';
          }

          return Scaffold(
            backgroundColor: Colors.grey[50],
            body: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40),
                  // Profile Section
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.blue[100],
                        backgroundImage:
                            picture != null ? NetworkImage(picture) : null,
                        child: picture == null
                            ? Icon(
                                Icons.person,
                                color: Colors.blue[800],
                                size: 30,
                              )
                            : null,
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                            ),
                          ),
                          Text(
                            age.isNotEmpty
                                ? '$age Years '
                                : 'Age not available',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink[400],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        ),
                        child: Text(
                          'Profile',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 30),

                  // Progress Bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'level $level',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[700],
                        ),
                      ),
                      Text(
                        'level ${level + 1}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),

                  LinearProgressIndicator(
                    value: 0.2,
                    backgroundColor: Colors.grey[300],
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.pink[400]!),
                    minHeight: 8,
                  ),

                  SizedBox(height: 5),

                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '300/1000 Exp',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),

                  SizedBox(height: 40),

                  // Courses Section
                  Row(
                    children: [
                      Text(
                        'Courses',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.orange[100],
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          Icons.school,
                          color: Colors.orange[800],
                          size: 30,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  // Course Grid
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 0.85,
                      children: [
                        _buildCourseCard(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LettersScreen(
                                    course: 'english',
                                  ),
                                ));
                          },
                          'English letters',
                          '(All letters in simple and fun way)',
                          [
                            {'letter': 'A', 'color': Colors.teal},
                            {'letter': 'B', 'color': Colors.blue},
                            {'letter': 'C', 'color': Colors.purple},
                          ],
                        ),
                        _buildCourseCard(
                          'Arabic letters',
                          '(All letters in simple and fun way)',
                          [
                            {'letter': 'أ', 'color': Colors.blue},
                            {'letter': 'ب', 'color': Colors.pink},
                            {'letter': 'ت', 'color': Colors.purple},
                          ],
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LettersScreen(
                                    course: 'arabic',
                                  ),
                                ));
                          },
                        ),
                        _buildCourseCard(
                          'Shapes',
                          '(All shapes in simple and fun way)',
                          [
                            {
                              'icon': Icons.change_history,
                              'color': Colors.orange
                            },
                            {'icon': Icons.pentagon, 'color': Colors.pink},
                            {'icon': Icons.circle, 'color': Colors.red},
                            {'icon': Icons.crop_square, 'color': Colors.cyan},
                          ],
                          isShapes: true,
                        ),
                        _buildCourseCard(
                          'Numbers',
                          '(All numbers in simple and fun way)',
                          [
                            {'letter': '1', 'color': Colors.teal},
                            {'letter': '2', 'color': Colors.orange},
                            {'letter': '3', 'color': Colors.purple},
                          ],
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NumberScreen(),
                                ));
                          },
                        ),
                      ],
                    ),
                  ),

                  // Exercises Section
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.pink[200]!, width: 2),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.pink[400],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.extension,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Exercises',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.teal[600],
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '(please note that the exercises based on the letters he learnt through the course)',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCourseCard(
      String title, String subtitle, List<Map<String, dynamic>> items,
      {bool isShapes = false, void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.pink[200]!, width: 2),
        ),
        child: Column(
          children: [
            // Icons/Letters
            Expanded(
              child: Center(
                child: isShapes
                    ? Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: items
                            .map((item) => Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: item['color'],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(
                                    item['icon'],
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ))
                            .toList(),
                      )
                    : Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: items
                            .map((item) => Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: item['color'],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Text(
                                      item['letter'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
              ),
            ),

            SizedBox(height: 15),

            // Title
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal[600],
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 8),

            // Subtitle
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
