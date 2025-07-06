import 'package:autism_app/Core/Utils/Assets/images/app_images.dart';
import 'package:autism_app/Core/Utils/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/percent_indicator.dart';

class BehavioursScreen extends StatefulWidget {
  const BehavioursScreen({Key? key}) : super(key: key);

  @override
  State<BehavioursScreen> createState() => _BehavioursScreenState();
}

class _BehavioursScreenState extends State<BehavioursScreen> {
  bool _familySelected = true;
  bool _hasHistory = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // App Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CustomBackButton(),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Behaviours',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 48), // Balance the back button
                ],
              ),
            ),

            // Category Toggle Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _familySelected = true;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.people_outline,
                              color: _familySelected
                                  ? Colors.blue
                                  : Colors.black54,
                              size: 24,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Family',
                              style: TextStyle(
                                fontSize: 18,
                                color: _familySelected
                                    ? Colors.blue
                                    : Colors.black54,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _familySelected = false;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.groups_outlined,
                              color: !_familySelected
                                  ? Colors.blue
                                  : Colors.black54,
                              size: 24,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Society',
                              style: TextStyle(
                                fontSize: 18,
                                color: !_familySelected
                                    ? Colors.blue
                                    : Colors.black54,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Content based on state
            Expanded(
              child: _hasHistory ? _buildHistoryView() : _buildNoHistoryView(),
            ),

            // Bottom Button or Message
            _hasHistory
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.lightbulb_outline,
                          color: Colors.blue,
                          size: 24,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'More features coming soon!',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            _hasHistory = true;
                          });
                        },
                        child: const Text(
                          'Add',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  // View for showing behavior history
  Widget _buildHistoryView() {
    return Column(
      children: [
        // Date navigator
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(Icons.chevron_left, color: Colors.blue),
                Text(
                  'Today, November 29',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Icon(Icons.chevron_right, color: Colors.blue),
              ],
            ),
          ),
        ),

        const SizedBox(height: 16),

        // Behaviour cards
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: [
              _buildBehaviourCard(
                icon: Icons.family_restroom,
                title: 'Interact with parents',
                description:
                    'exp (talking with them, spending time with them, sharing stuff with them)',
                percent: 0.6,
                color: Colors.blue,
                imagePath: 'assets/images/family.png',
              ),
              const SizedBox(height: 16),
              _buildBehaviourCard(
                icon: Icons.people,
                title: 'Interact with siblings',
                description:
                    'exp (talking with them, spending time with them, sharing stuff with them)',
                percent: 0.6,
                color: Colors.red,
                imagePath: 'assets/images/siblings.png',
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Widget for behavior card
  Widget _buildBehaviourCard({
    required IconData icon,
    required String title,
    required String description,
    required double percent,
    required Color color,
    required String imagePath,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(icon, color: color),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.edit_outlined, color: Colors.blue),
                onPressed: () {
                  // Handle edit
                },
                iconSize: 20,
                padding: const EdgeInsets.all(6),
                constraints: const BoxConstraints(),
              ),
            ],
          ),
          Row(
            children: [
              // Left side with icon, title, description and progress
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Description
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Circular progress indicator
                    CircularPercentIndicator(
                      radius: 40.0,
                      lineWidth: 8.0,
                      percent: percent,
                      center: Text(
                        "${(percent * 100).toInt()}%",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      progressColor: color,
                      backgroundColor: Colors.grey[200]!,
                      circularStrokeCap: CircularStrokeCap.round,
                    ),
                  ],
                ),
              ),

              // Right side with image and edit button
              SizedBox(
                height: 150,
                width: 150,
                child: Image.asset(
                  AppImages.EmptyGroup,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // View for no history
  Widget _buildNoHistoryView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 250,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.blue.shade300, width: 2),
          ),
          child: Center(
            child: Text(
              "Empty State Illustration\n(Person waiting)",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            // In actual implementation, use:
            // Image.asset(
            //   'assets/images/empty_state.png',
            //   fit: BoxFit.cover,
            // ),
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'There is no History found !',
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
