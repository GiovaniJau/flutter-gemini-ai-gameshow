import 'package:ai_gameshow/providers/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessageInput extends ConsumerWidget {
  const MessageInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(chatProvider.notifier);
    final state = ref.watch(chatProvider);

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 25,
          horizontal: 15,
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                autofocus: true,
                focusNode: provider.textFieldFocus,
                controller: provider.textController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(15),
                  hintText: 'Digite sua escolha...',
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(14),
                    ),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(14),
                    ),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
                onSubmitted: (_) {
                  provider.sendChatMessage();
                },
              ),
            ),
            const SizedBox.square(
              dimension: 15,
            ),
            state.loading
                ? CircularProgressIndicator()
                : IconButton(
                    onPressed: () {
                      provider.sendChatMessage();
                    },
                    icon: Icon(
                      Icons.send,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
