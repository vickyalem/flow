import 'package:flutter/material.dart';

class SharingPage extends StatelessWidget {
  const SharingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.forum,
            size: 80,
            color: Theme.of(context).colorScheme.outline,
          ),
          SizedBox(
            width: 200,
            child: Text(
              "Sharing features are coming soon.",
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
