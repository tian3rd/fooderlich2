import 'package:flutter/material.dart';
import 'circle_image.dart';
import 'fooderlich_theme.dart';

class AuthorCard extends StatelessWidget {
  final String authorName;
  final String title;
  final ImageProvider? imageProvider;

  const AuthorCard({
    Key? key,
    required this.authorName,
    required this.title,
    this.imageProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: replace Container()
    return Container(
      padding: const EdgeInsets.all(4),
      child: Row(
        // TODO 3: add alignment
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleImage(
                imageProvider: imageProvider,
                imageRadius: 32,
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    authorName,
                    style: FooderlichTheme.lightTextTheme.headline2,
                  ),
                  Text(
                    title,
                    style: FooderlichTheme.lightTextTheme.bodyText1,
                  ),
                ],
              ),
            ],
          ),
          // TODO 2: add IconButton
          IconButton(
            iconSize: 32,
            color: Colors.grey[400],
            onPressed: () {
              const snackBar = SnackBar(
                content: Text(
                  'Added to your favorites',
                ),
                duration: Duration(seconds: 1),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);},
            icon: const Icon(Icons.favorite_border),
          ),
        ],
      ),
    );
  }

}