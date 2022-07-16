import 'package:flutter/material.dart';

import '../models/models.dart';

class RecipeThumbnail extends StatelessWidget {
  final SimpleRecipe recipe;

  const RecipeThumbnail({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // for the image to take up whole remaining space
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  '${recipe.dishImage}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '${recipe.title}',
              // restrict to 1 line
              maxLines: 1,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 8),
            Text(
              '${recipe.duration}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
      )
    );
  }
}