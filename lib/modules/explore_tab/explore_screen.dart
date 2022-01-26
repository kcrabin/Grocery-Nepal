import 'package:flutter/material.dart';
import 'package:grocery_nepal/modules/explore_tab/widgets/category_bar.dart';

import 'widgets/product_tile.dart';
import 'widgets/search_bar.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokhara, Nepal'),
      ),
      body: Column(
        children: const [
          SerchBar(),
          Expanded(
            child: CategoryBar(),
          )
        ],
      ),
    );
  }
}
