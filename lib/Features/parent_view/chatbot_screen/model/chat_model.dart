class ChatMessage {
  final String id;
  final String text;
  final bool isUser; // true if sent by user, false if sent by bot
  final DateTime timestamp;

  ChatMessage({
    required this.id,
    required this.text,
    required this.isUser,
    required this.timestamp,
  });
}
