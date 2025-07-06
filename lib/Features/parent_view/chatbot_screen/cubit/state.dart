import 'package:autism_app/Features/parent_view/chatbot_screen/model/chat_model.dart';

abstract class ChatbotState {
  const ChatbotState();
}

class ChatbotInitial extends ChatbotState {}

class ChatbotLoading extends ChatbotState {}

class ChatbotReady extends ChatbotState {
  final List<ChatMessage> messages;
  final bool isTyping; // To show bot typing indicator

  ChatbotReady({required this.messages, this.isTyping = false});
}

class ChatbotError extends ChatbotState {
  final String message;

  ChatbotError({required this.message});
}
