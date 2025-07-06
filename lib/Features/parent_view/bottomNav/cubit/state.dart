enum NavigationTab { home, social, reports, chatbot, profile }

class NavigationState {
  final NavigationTab currentTab;

  NavigationState({
    required this.currentTab,
  });

  factory NavigationState.initial() {
    return NavigationState(
      currentTab: NavigationTab.home,
    );
  }

  NavigationState copyWith({
    NavigationTab? currentTab,
  }) {
    return NavigationState(
      currentTab: currentTab ?? this.currentTab,
    );
  }
}
