import 'package:autism_app/Features/parent_view/comunity_screen/cubit/state.dart';
import 'package:bloc/bloc.dart';

class CommunityCubit extends Cubit<CommunityState> {
  CommunityCubit() : super(CommunityState.initial());

  void changeTab(CommunityTab tab) {
    emit(state.copyWith(activeTab: tab));
  }
}
