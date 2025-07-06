import 'package:autism_app/Core/Utils/Assets/images/app_images.dart';
import 'package:autism_app/Features/parent_view/bottomNav/bottomNav.dart';
import 'package:autism_app/Features/parent_view/comunity_screen/cubit/cubit.dart';
import 'package:autism_app/Features/parent_view/comunity_screen/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CommunityCubit(),
      child: const CommunityScreenContent(),
    );
  }
}

class CommunityScreenContent extends StatelessWidget {
  const CommunityScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: null,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Community',
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          BlocBuilder<CommunityCubit, CommunityState>(
            builder: (context, state) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: _TabButton(
                        label: 'My Groups',
                        isActive: state.activeTab == CommunityTab.groups,
                        iconData: Icons.group,
                        onTap: () => context
                            .read<CommunityCubit>()
                            .changeTab(CommunityTab.groups),
                        iconColor: Colors.blue,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _TabButton(
                        label: 'My invitations',
                        isActive: state.activeTab == CommunityTab.invitations,
                        iconData: Icons.person_add,
                        onTap: () => context
                            .read<CommunityCubit>()
                            .changeTab(CommunityTab.invitations),
                        badgeCount: 1,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 8),
          BlocBuilder<CommunityCubit, CommunityState>(
            builder: (context, state) {
              if (state.activeTab == CommunityTab.groups) {
                return const Expanded(child: GroupsEmptyView());
              } else {
                return const Expanded(child: InvitationsView());
              }
            },
          ),
        ],
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  final String label;
  final bool isActive;
  final IconData iconData;
  final VoidCallback onTap;
  final int? badgeCount;
  final Color iconColor;

  const _TabButton({
    required this.label,
    required this.isActive,
    required this.iconData,
    required this.onTap,
    this.badgeCount,
    this.iconColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isActive
              ? Colors.blue.withOpacity(0.1)
              : Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isActive
                ? Colors.blue.withOpacity(0.3)
                : Colors.grey.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: isActive ? Colors.blue : Colors.grey,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: isActive ? Colors.blue : Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (badgeCount != null && badgeCount! > 0) ...[
              const SizedBox(width: 4),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  badgeCount.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
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

// lib/widgets/groups_empty_view.dart

class GroupsEmptyView extends StatelessWidget {
  const GroupsEmptyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppImages.EmptyGroup, // Make sure to add this image to your assets
          height: 200,
        ),
        const SizedBox(height: 20),
        const Text(
          'There is no groups at this moment',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 30),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Join Now',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// lib/widgets/invitations_view.dart

class InvitationsView extends StatelessWidget {
  const InvitationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppImages
              .Empty_Invitation, // Make sure to add this image to your assets
          height: 200,
        ),
        const SizedBox(height: 20),
        const Text(
          'You got one invitation remaining!',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Check now!',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
