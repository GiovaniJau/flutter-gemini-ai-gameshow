import 'package:ai_gameshow/components/chat_list.dart';
import 'package:ai_gameshow/components/message_input.dart';
import 'package:ai_gameshow/components/score_card.dart';
import 'package:ai_gameshow/providers/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chatProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("AI Gameshow"),
        actions: [
          ScoreCard(),
        ],
      ),
      body: state.ready
          ? Column(
              children: [
                Expanded(child: ChatList()),
                MessageInput(),
              ],
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
