enum CommunityTab { groups, invitations }

class CommunityState {
  final CommunityTab activeTab;

  const CommunityState({
    required this.activeTab,
  });

  factory CommunityState.initial() {
    return const CommunityState(
      activeTab: CommunityTab.groups,
    );
  }

  CommunityState copyWith({
    CommunityTab? activeTab,
  }) {
    return CommunityState(
      activeTab: activeTab ?? this.activeTab,
    );
  }
}
