import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key,
      required this.title,
      required this.body,
      required this.createdAt});

  final String title;
  final String body;
  final DateTime createdAt;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0),
              color: Theme.of(context).colorScheme.surfaceContainer),
          margin: const EdgeInsets.fromLTRB(12.0, 2, 12, 12),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(children: [
              Flexible(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat('EEEE, d MMM yyyy').format(createdAt),
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Theme.of(context).colorScheme.outline),
                  ),
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    body,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              )),
              IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.chevron_right,
                    color: Theme.of(context).colorScheme.primary,
                  ))
            ]),
          ),
        ),
      ],
    );
  }
}
