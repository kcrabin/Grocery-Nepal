import 'package:flutter/material.dart';
import 'package:grocery_nepal/modules/explore_tab/widgets/category_bar.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/modules/explore_tab/widgets/explore_tab_controller.dart';
import 'package:grocery_nepal/widgets/widgets.dart';

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
            ? const Loading()
            : controller.isError.isTrue
                ? ErrorPage(
                    errorMessage: controller.errorMessage,
                    onRetry: controller.getProducts)
                : RefreshIndicator(
                    onRefresh: controller.getProducts,
                    child: Column(
                      children: [
                        const SerchBar(),
                        Expanded(
                          child: CategoryBar(products: controller.products),
                        )
                      ],
                    ),
                  ),
      ),
    );
  }
}
