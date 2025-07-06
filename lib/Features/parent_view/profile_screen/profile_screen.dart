// profile_screen.dart
import 'package:autism_app/Core/Utils/Assets/images/app_images.dart';
import 'package:autism_app/Features/parent_view/profile_screen/cubit/cubit.dart';
import 'package:autism_app/Features/parent_view/profile_screen/cubit/state.dart';
import 'package:autism_app/Features/parent_view/profile_screen/widget/child_profile/child_profile.dart';
import 'package:autism_app/Features/parent_view/profile_screen/widget/child_profile/cubit/cubit.dart';
import 'package:autism_app/Features/parent_view/profile_screen/widget/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: ProfilesScreen(),
    );
  }
}

class ProfilesScreen extends StatefulWidget {
  const ProfilesScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfilesScreen> {
  @override
  void initState() {
    super.initState();
    // Load profile data when screen initializes
    context.read<ProfileCubit>().loadProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProfileError) {
            return Center(child: Text(state.message));
          }

          final cubit = context.read<ProfileCubit>();

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // User profile section
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                AppImages.Maria,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child:
                                    Icon(Icons.camera_alt, color: Colors.grey),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cubit.userData['name'] ?? '',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              cubit.userData['email'] ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: Colors.grey,
                                  ),
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => EditProfile()),
                                );
                              },
                              child: const Text('Edit profile'),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'My children\'s',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Row(children: [
                        Text(
                          'Select your primary child',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.grey,
                                  ),
                        ),
                        Icon(Icons.chevron_right),
                      ]),
                    ],
                  ),
                ),

                // Children section
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cubit.children.length + 1, // +1 for Add button
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        // Add child button
                        return Container(
                          width: 100,
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(Icons.add, size: 30),
                              ),
                              const SizedBox(height: 8),
                              Text('Add'),
                            ],
                          ),
                        );
                      }

                      final child = cubit.children[index - 1];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => BlocProvider(
                                create: (_) => ChildProfileCubit(child['name']),
                                child: ChildProfileScreen(),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: 100,
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                        AssetImage(child['avatar'] ?? ''),
                                  ),
                                  if (child['isPrimary'] == true)
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(Icons.check,
                                            color: Colors.white, size: 16),
                                      ),
                                    ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(child['name']),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                Divider(),

                // Settings options
                _buildSettingsOption(context, Icons.settings, 'Settings'),
                _buildSettingsOption(context, Icons.location_on, 'Location'),
                _buildSettingsOption(context, Icons.language, 'Languages'),
                _buildSettingsOption(
                    context, Icons.monetization_on, 'Subscription'),

                Divider(),

                // Data options
                _buildSettingsOption(context, Icons.data_usage, 'My data'),
                _buildSettingsOption(
                    context, Icons.delete_outline, 'Clear cache'),
                _buildSettingsOption(context, Icons.history, 'Clear history'),
                _buildSettingsOption(context, Icons.logout, 'Logout'),

                const SizedBox(height: 80), // Space for bottom navigation
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSettingsOption(
      BuildContext context, IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[700]),
      title: Text(title),
      trailing: Icon(Icons.chevron_right),
      onTap: () {},
    );
  }
}
