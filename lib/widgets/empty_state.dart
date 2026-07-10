import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final int filterIndex;
  const EmptyState({super.key, required this.filterIndex});

  @override
  Widget build(BuildContext context) {
    const messages = [
      ['No tasks yet!', 'Tap + to add your first task.'],
      ['All caught up!', 'No pending tasks — nice work.'],
      ['Nothing here yet.', 'Complete a task to see it here.'],
    ];
    final msg = messages[filterIndex];
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            filterIndex == 2 ? Icons.check_circle_outline : Icons.inbox_outlined,
            color: const Color(0xffFFEA00).withValues(alpha: 0.3),
            size: 72,
          ),
          const SizedBox(height: 16),
          Text(
            msg[0],
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            msg[1],
            style: const TextStyle(color: Colors.white30, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
