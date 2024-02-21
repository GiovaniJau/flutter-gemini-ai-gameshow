import 'package:ai_gameshow/components/chat_message.dart';
import 'package:ai_gameshow/providers/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatList extends ConsumerWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(chatProvider.notifier);
    final state = ref.watch(chatProvider);

    return ListView.builder(
      controller: provider.scrollController,
      itemBuilder: (context, index) {
        if (index == 0) return const SizedBox.shrink(); // don't show the initial prompt

        final content = provider.chat.history.toList()[index];
        final text = content.parts.whereType<TextPart>().map<String>((e) => e.text).join("");

        return ChatMessage(
          text: text,
          isFromUser: content.role == 'usuário',
        );
      },
      itemCount: provider.chat.history.length,
    );
  }
}
