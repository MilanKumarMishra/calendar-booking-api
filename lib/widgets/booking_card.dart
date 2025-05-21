import 'package:flutter/material.dart';

class BookingCard extends StatelessWidget {
  final String userId;
  final String startTime;
  final String endTime;

  const BookingCard({
    super.key,
    required this.userId,
    required this.startTime,
    required this.endTime,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: const Icon(Icons.meeting_room),
        title: Text('User: $userId'),
        subtitle: Text('From: $startTime\nTo: $endTime'),
      ),
    );
  }
}
