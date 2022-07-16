import 'package:flutter/material.dart';

import '../components/components.dart';
import '../models/models.dart';
import '../api/mock_fooderlich_service.dart';

class ExploreScreen extends StatelessWidget {
  final mockService = MockFooderlichService();

  ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO 1: add TodayRecipeListView FutureBuilder
    return FutureBuilder(
        future: mockService.getExploreData(),
        builder: (context, AsyncSnapshot<ExploreData> snapshot) {
          // TODO: add nested list views
          if (snapshot.connectionState == ConnectionState.done) {
            final recipes = snapshot.data?.todayRecipes ?? [];
            // TODO: replace this with TodayRecipeListView
            return Center(
              child: Container(
                child: const Text('Show TodayRecipeListView'),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
    );
  }
}