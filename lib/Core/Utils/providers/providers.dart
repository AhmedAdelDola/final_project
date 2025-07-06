import 'package:autism_app/Features/auth/cubit/auth_cubit.dart';
import 'package:autism_app/Features/child_view/course/cubit/course_cubit.dart';
import 'package:autism_app/Features/child_view/home/cubit/child_profile_cubit.dart';
import 'package:autism_app/Features/parent_view/home_screen/cubits/diary_cubit.dart';
import 'package:autism_app/Features/parent_view/report_screen/cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  BlocProvider(create: (context) => AuthCubit()),
  BlocProvider(create: (context) => DiaryCubit()),
  BlocProvider(create: (context) => ReportCubit()),
  BlocProvider(create: (context) => ChildInfoCubit()),
  BlocProvider(create: (context) => CourseCubit()),
];
