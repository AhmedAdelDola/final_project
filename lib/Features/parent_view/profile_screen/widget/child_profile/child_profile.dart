// child_profile_screen.dart
import 'package:autism_app/Core/Utils/Assets/images/app_images.dart';
import 'package:autism_app/Core/Utils/widgets/custom_back_button.dart';
import 'package:autism_app/Features/parent_view/profile_screen/widget/child_profile/cubit/cubit.dart';
import 'package:autism_app/Features/parent_view/profile_screen/widget/child_profile/cubit/state.dart';
import 'package:autism_app/Features/parent_view/profile_screen/widget/child_profile/widget/Activity.dart';
import 'package:autism_app/Features/parent_view/profile_screen/widget/child_profile/widget/behavior.dart';
import 'package:autism_app/Features/parent_view/profile_screen/widget/child_profile/widget/video_track.dart';
import 'package:autism_app/Features/parent_view/profile_screen/widget/edit_child_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChildProfileScreen extends StatelessWidget {
  const ChildProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ChildProfileCubit, ChildProfileState>(
        builder: (context, state) {
          if (state is ChildProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ChildProfileError) {
            return Center(child: Text(state.message));
          }

          final cubit = context.read<ChildProfileCubit>();

          return SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    CustomBackButton(),
                    Center(
                      child: Text('Child Profile',
                          style: Theme.of(context).textTheme.titleLarge),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Flexible(
                  child: Stack(children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50)),
                                border: Border.all(
                                    width: 2,
                                    color:
                                        Color.fromRGBO(205, 224, 255, 0.82))),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 40,
                                  ),
                                  // Child avatar and name
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 10),
                                          Text(
                                            cubit.childName,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge,
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            'Personal information',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall
                                                ?.copyWith(
                                                  color: Colors.grey,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                  // Options grid
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        spacing: 10,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            spacing: 10,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: _buildOptionCard(
                                                  context,
                                                  Icons.person,
                                                  Colors.blue,
                                                  'Child profile',
                                                  onTaps: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (_) =>
                                                              EditeChildProfile()),
                                                    );
                                                  },
                                                ),
                                              ),
                                              Expanded(
                                                child: _buildOptionCard(
                                                  context,
                                                  Icons.favorite,
                                                  Colors.red,
                                                  'Health care',
                                                  onTaps: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (_) =>
                                                              ActivityScreen()),
                                                    );
                                                  },
                                                ),
                                              ),
                                              Expanded(
                                                child: _buildOptionCard(
                                                  context,
                                                  Icons.videocam,
                                                  Colors.purple,
                                                  'Video tracking',
                                                  onTaps: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (_) =>
                                                              VideoTrackingScreen()),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            spacing: 10,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: _buildOptionCard(
                                                  context,
                                                  Icons.sentiment_satisfied_alt,
                                                  Colors.red,
                                                  'Behaviours',
                                                  onTaps: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (_) =>
                                                              BehavioursScreen()),
                                                    );
                                                  },
                                                ),
                                              ),
                                              Expanded(
                                                child: _buildOptionCard(
                                                    context,
                                                    Icons.timelapse,
                                                    Colors.blue,
                                                    'Coming soon',
                                                    isComingSoon: true),
                                              ),
                                              Expanded(
                                                child: _buildOptionCard(
                                                    context,
                                                    Icons.timelapse,
                                                    Colors.purple,
                                                    'Coming soon',
                                                    isComingSoon: true),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 16.0, bottom: 8.0),
                                            child: Text(
                                              'Manage more options',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall
                                                  ?.copyWith(
                                                    color: Colors.grey,
                                                  ),
                                            ),
                                          ),
                                          Row(
                                            spacing: 10,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: _buildOptionCard(
                                                    context,
                                                    Icons.delete,
                                                    Colors.red,
                                                    'Delete'),
                                              ),
                                              Expanded(
                                                child: _buildOptionCard(
                                                    context,
                                                    Icons.add,
                                                    Colors.blue,
                                                    'Add child'),
                                              ),
                                              Expanded(
                                                child: _buildOptionCard(
                                                    context,
                                                    Icons.share,
                                                    Colors.purple,
                                                    'Share profile'),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            spacing: 10,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: _buildOptionCard(
                                                    context,
                                                    Icons.timelapse,
                                                    Colors.purple,
                                                    'Coming soon',
                                                    isComingSoon: true),
                                              ),
                                              Expanded(
                                                child: _buildOptionCard(
                                                    context,
                                                    Icons.timelapse,
                                                    Colors.blue,
                                                    'Coming soon',
                                                    isComingSoon: true),
                                              ),
                                              Expanded(
                                                child: _buildOptionCard(
                                                    context,
                                                    Icons.timelapse,
                                                    Colors.red,
                                                    'Coming soon',
                                                    isComingSoon: true),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 2,
                                  color: Color.fromRGBO(205, 224, 255, 0.82))),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(
                              AppImages.Maria,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildOptionCard(
      BuildContext context, IconData icon, Color color, String title,
      {bool isComingSoon = false, void Function()? onTaps}) {
    return GestureDetector(
      onTap: onTaps,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                width: 2, color: Color.fromRGBO(193, 188, 188, 0.16))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: isComingSoon
                      ? Column(
                          children: [
                            Icon(icon, color: Colors.white, size: 18),
                            Text(
                              'SOON',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 8,
                              ),
                            ),
                          ],
                        )
                      : Icon(icon, color: Colors.white, size: 24),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 8),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
