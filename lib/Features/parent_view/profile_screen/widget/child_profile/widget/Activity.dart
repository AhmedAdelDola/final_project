import 'package:autism_app/Core/Utils/widgets/custom_back_button.dart';
import 'package:autism_app/Features/parent_view/profile_screen/widget/child_profile/widget/ActivityCard%20.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool showActivities = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        showActivities = _tabController.index == 0;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
                        'Activities',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40), // Balance the layout
                ],
              ),
            ),

            // Tab Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            _tabController.animateTo(0);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: showActivities
                                  ? Colors.white
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: showActivities
                                    ? Colors.blue.shade100
                                    : Colors.transparent,
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.access_time_rounded,
                                  color: showActivities
                                      ? Colors.blue
                                      : Colors.grey,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Activities',
                                  style: TextStyle(
                                    color: showActivities
                                        ? Colors.blue
                                        : Colors.grey,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            _tabController.animateTo(1);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: !showActivities
                                  ? Colors.white
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: !showActivities
                                    ? Colors.blue.shade100
                                    : Colors.transparent,
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.medical_services_outlined,
                                  color: !showActivities
                                      ? Colors.blue
                                      : Colors.grey,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Medications',
                                  style: TextStyle(
                                    color: !showActivities
                                        ? Colors.blue
                                        : Colors.grey,
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
              ),
            ),

            // Tab View
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Activities Tab
                  const ActivitiesTab(),

                  // Medications Tab
                  const MedicationsTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActivitiesTab extends StatelessWidget {
  const ActivitiesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sleep Info Card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Bedtime
                Column(
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.nights_stay, color: Colors.blue, size: 20),
                        SizedBox(width: 4),
                        Text(
                          'Bedtime',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '19:00',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                // Alarm
                Column(
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.alarm, color: Colors.blue, size: 20),
                        SizedBox(width: 4),
                        Text(
                          'Alarm',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '09:00',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                // Time Left
                Column(
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.info_outline, color: Colors.blue, size: 20),
                        SizedBox(width: 4),
                        Text(
                          'Time left',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '2h',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Sleep Tips
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.lightbulb_outline,
                    color: Colors.blue,
                    size: 18,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Tips to sleep better?',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Find out',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // Today Activities Title
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'Today Activities',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Activity Grid
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: MediaQuery.of(context).size.height / 1150,
            children: const [
              // Walk Card
              ActivityCard(
                title: 'Walk',
                value: '2000',
                unit: 'Steps',
                color: Color(0xFF8A56FC),
                icon: Icons.directions_walk,
                percent: 0.65,
                progressColor: Colors.white,
                RowChild: true,
              ),

              // Heart Card
              ActivityCard(
                title: 'Heart',
                value: '100',
                subValue: '100',
                unit: '/min',
                subLabel: '/min',
                color: Colors.white,
                icon: Icons.favorite,
                iconColor: Colors.red,
                percent: 0.7,
                progressColor: Colors.red,
                showHeartbeat: true,
                showindicator: false,
                RowChild: true,
              ),

              // Sleep Card
              ActivityCard(
                title: 'Sleep',
                value: '65',
                unit: '%',
                subValue: '6h 50m',
                subLabel: 'Sleep Duration',
                color: Colors.white,
                icon: Icons.nightlight_round,
                iconColor: Colors.blue,
                percent: 0.65,
                progressColor: Colors.blue,
                RowChild: false,
              ),

              // Homework Card
              ActivityCard(
                title: 'Homework',
                label: 'Average',
                value: '70',
                unit: '%',
                subValue: '7h',
                subLabel: '/day',
                color: Colors.white,
                icon: Icons.book,
                iconColor: Colors.orange,
                percent: 0.7,
                progressColor: Colors.orange,
                RowChild: true,
              ),

              // Games Card
              ActivityCard(
                title: 'Games',
                label: 'Average',
                value: '80',
                unit: '%',
                subValue: '8h',
                subLabel: '/day',
                color: Colors.white,
                icon: Icons.sports_esports,
                iconColor: Colors.red,
                percent: 0.8,
                progressColor: Colors.red,
                RowChild: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MedicationsTab extends StatelessWidget {
  const MedicationsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Illustration
                Image.asset(
                  'assets/images/no_data.png',
                  width: 200,
                  height: 200,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 24),
                // Empty State Text
                const Text(
                  'There is no medical files now !',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // Add File Button
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text(
                'Add File',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
