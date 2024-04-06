import 'package:flutter/material.dart';
import 'package:app/src/documents/components/event_card.dart';
import 'package:app/src/documents/models/event_model.dart';

class EventList extends StatelessWidget {
  final List<Event>? events;

  const EventList({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    if (events!.isEmpty) {
      return const Center(
        child: Text('There are no upcoming events.'),
      );
    }

    return ListView.builder(
      itemCount: events!.length,
      itemBuilder: (context, index) {
        return EventCard(event: events![index]);
      },
    );
  }
}
