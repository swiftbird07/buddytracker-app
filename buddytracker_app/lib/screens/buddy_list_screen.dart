// screens/buddy_list_screen.dart
import 'package:flutter/material.dart';

class BuddyListScreen extends StatelessWidget {
  const BuddyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> buddies = ['Alice', 'Bob', 'Charlie'];

    return ListView.builder(
      itemCount: buddies.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            child: Text(buddies[index][0]), // Erster Buchstabe des Namens
          ),
          title: Text(buddies[index]),
          subtitle: const Text('Status: Online'),  // Beispiel-Status
          trailing: IconButton(
            icon: const Icon(Icons.message),
            onPressed: () {
              // ToDo: Implement buddy interaction
            },
          ),
        );
      },
    );
  }
}