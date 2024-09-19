import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Padding(
        //   padding: const EdgeInsets.only(left: 20.0),
        //   child: Text(
        //     now.toString(),
        //     style: const TextStyle(fontSize: 12),
        //   ),
        // ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0),
              color: Theme.of(context).colorScheme.primaryContainer),
          margin: const EdgeInsets.fromLTRB(12.0, 2, 12, 12),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(children: [
              Flexible(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    body,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              )),
              const IconButton(onPressed: null, icon: Icon(Icons.chevron_right))
            ]),
          ),
        ),
      ],
    );
  }
}