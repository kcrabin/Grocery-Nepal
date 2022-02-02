import 'package:flutter/material.dart';
import 'package:grocery_nepal/modules/explore_tab/widgets/category_bar.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/modules/explore_tab/widgets/explore_tab_controller.dart';

import 'widgets/product_tile.dart';
import 'widgets/search_bar.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ExploreTabController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokhara, Nepal'),
      ),
      body: Obx(
        () => controller.isLoading.isTrue
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : controller.isError.isTrue
                ? Center(
                    child: Column(children: [
                      Text(controller.errorMessage),
                      ElevatedButton(
                          onPressed: controller.getProducts,
                          child: const Text('Try again'))
                    ]),
                  )
                : Column(
                    children: [
                      SerchBar(),
                      Expanded(
                        child: CategoryBar(products: controller.products),
                      )
                    ],
                  ),
      ),
    );
  }
}
