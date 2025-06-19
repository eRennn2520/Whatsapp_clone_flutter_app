import 'package:flutter/material.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final calls = List.generate(
      8,
      (index) => {
        "name": "full name",
        "time": "20 minutes ago",
        "image": index % 2 == 0
            ? "https://randomuser.me/api/portraits/women/44.jpg"
            : "https://randomuser.me/api/portraits/men/32.jpg",
        "type": index % 3 == 0
            ? "incoming"
            : index % 3 == 1
            ? "missed"
            : "outgoing",
      },
    );

    return ListView.builder(
      itemCount: calls.length,
      itemBuilder: (context, index) {
        final call = calls[index];
        Icon callIcon;
        Color arrowColor;

        switch (call["type"]) {
          case "incoming":
            callIcon = const Icon(
              Icons.call_received,
              color: Colors.green,
              size: 18,
            );
            arrowColor = Colors.green;
            break;
          case "missed":
            callIcon = const Icon(
              Icons.call_missed,
              color: Colors.red,
              size: 18,
            );
            arrowColor = Colors.red;
            break;
          default:
            callIcon = const Icon(
              Icons.call_made,
              color: Colors.green,
              size: 18,
            );
            arrowColor = Colors.green;
        }

        return ListTile(
          leading: CircleAvatar(backgroundImage: NetworkImage(call["image"]!)),
          title: Text(
            call["name"]!,
            style: const TextStyle(color: Colors.white),
          ),
          subtitle: Row(
            children: [
              Icon(callIcon.icon, color: arrowColor, size: 16),
              const SizedBox(width: 4),
              Text(call["time"]!, style: const TextStyle(color: Colors.grey)),
            ],
          ),
          trailing: const Icon(Icons.call, color: Colors.green),
        );
      },
    );
  }
}
