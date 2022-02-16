import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/modules/favourites/favourites_controller.dart';
import 'package:grocery_nepal/modules/product_detail/product_detail_screen.dart';
import 'package:grocery_nepal/widgets/loading.dart';

class FavouriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favourites'),
        ),
        body: GetBuilder<FavouitesController>(builder: (controller) {
          return controller.favourites.isEmpty
              ? Center(
                  child: Text('You have no favourites'),
                )
              : ListView.builder(
                  itemCount: controller.favourites.length,
                  itemBuilder: (context, index) => Card(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                          onTap: () {
                            Get.to(() => ProductDetail(),
                                arguments: controller.favourites[index]);
                          },
                          leading: CachedNetworkImage(
                            imageUrl: controller.favourites[index].image,
                            placeholder: (context, url) =>
                                const Loading(size: 100),
                            errorWidget: (context, url, error) => Image.asset(
                              'assets/images/dummy_image.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(controller.favourites[index].name),
                          trailing: IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: const Text(
                                            'Do You Want to Remove from favourites?'),
                                        // content: Text('This is content'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              controller.removeFavourite(
                                                  controller.favourites[index]);

                                              Navigator.pop(context);
                                            },
                                            child: const Text('Remove'),
                                          ),
                                        ],
                                      ));
                            },
                            icon: const Icon(Icons.delete),
                          )),
                    ),
                  ),
                );
        }));
  }
}
