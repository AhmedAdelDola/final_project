import 'package:autism_app/Features/parent_view/chatbot_screen/cubit/state.dart';
import 'package:autism_app/Features/parent_view/chatbot_screen/model/chat_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatbotCubit extends Cubit<ChatbotState> {
  ChatbotCubit() : super(ChatbotInitial()) {
    // Initialize with greeting message
    _initialize();
  }

  void _initialize() async {
    emit(ChatbotLoading());

    try {
      // Simulate initial load delay
      await Future.delayed(Duration(milliseconds: 500));

      // Add welcome message from bot
      final initialMessage = ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        text: 'Hi there! How can I help you today?',
        isUser: false,
        timestamp: DateTime.now(),
      );

      emit(ChatbotReady(messages: [initialMessage]));
    } catch (e) {
      emit(ChatbotError(message: 'Failed to initialize chat: ${e.toString()}'));
    }
  }

  void sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    if (state is ChatbotReady) {
      final currentState = state as ChatbotReady;
      final currentMessages = List<ChatMessage>.from(currentState.messages);

      // Add user message
      final userMessage = ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        text: text,
        isUser: true,
        timestamp: DateTime.now(),
      );

      currentMessages.add(userMessage);

      // Emit updated state with user message and typing indicator
      emit(ChatbotReady(messages: currentMessages, isTyping: true));

      // Simulate bot response delay
      await Future.delayed(Duration(seconds: 1));

      // Generate bot response
      final botResponse = await _generateBotResponse(text);

      // Add bot message
      final botMessage = ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        text: botResponse,
        isUser: false,
        timestamp: DateTime.now(),
      );

      currentMessages.add(botMessage);

      // Emit updated state with bot message and no typing indicator
      emit(ChatbotReady(messages: currentMessages, isTyping: false));
    }
  }

  Future<String> _generateBotResponse(String userMessage) async {
    // Simple mock responses - in a real app, this would connect to an API
    final lowerCaseMsg = userMessage.toLowerCase();

    if (lowerCaseMsg.contains('hello') || lowerCaseMsg.contains('hi')) {
      return 'Hello! How are you today?';
    } else if (lowerCaseMsg.contains('how are you')) {
      return 'I\'m doing great, thanks for asking! How can I assist you?';
    } else if (lowerCaseMsg.contains('help')) {
      return 'I can help you with checking your reports, scheduling appointments, or answering health-related questions. What do you need assistance with?';
    } else if (lowerCaseMsg.contains('report')) {
      return 'Your latest report shows everything is normal. You can check the details in the Reports tab.';
    } else if (lowerCaseMsg.contains('appointment')) {
      return 'Would you like to schedule a new appointment? I can help you with that.';
    } else {
      return 'I understand you said: "$userMessage". How can I help you with that?';
    }
  }

  void clearChat() {
    _initialize();
  }
}
