import 'package:autism_app/Features/parent_view/bottomNav/cubit/state.dart';
import 'package:autism_app/Features/parent_view/chatbot_screen/chatbot_screen.dart';
import 'package:autism_app/Features/parent_view/comunity_screen/comunity_screen.dart';
import 'package:autism_app/Features/parent_view/home_screen/home_screen.dart';
import 'package:autism_app/Features/parent_view/profile_screen/profile_screen.dart';
import 'package:autism_app/Features/parent_view/report_screen/report_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState.initial());

  static NavigationCubit get(context) => BlocProvider.of(context);

  List Screens = [
    HomeScreen(),
    CommunityScreen(),
    ReportScreen(),
    ChatbotScreen(),
    ProfileScreen(),
  ];

  void setTab(NavigationTab tab) {
    emit(state.copyWith(currentTab: tab));
  }
}
