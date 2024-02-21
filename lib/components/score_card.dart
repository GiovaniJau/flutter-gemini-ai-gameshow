import 'package:ai_gameshow/providers/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScoreCard extends ConsumerWidget {
  const ScoreCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chatProvider);

    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Text(
        "Pontos: ${state.correctAnswers}/${state.totalAnswers}",
      ),
    );
  }
}
