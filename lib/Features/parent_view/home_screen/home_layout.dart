import 'package:autism_app/Features/parent_view/bottomNav/bottomNav.dart';
import 'package:autism_app/Features/parent_view/bottomNav/cubit/cubit.dart';
import 'package:autism_app/Features/parent_view/bottomNav/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NavigationCubit(),
        child: BlocBuilder<NavigationCubit, NavigationState>(
            builder: (context, state) {
          var cubit = NavigationCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            bottomNavigationBar: BottomNavBar(),
            body: cubit.Screens[state.currentTab.index],
          );
        }));
  }
}
