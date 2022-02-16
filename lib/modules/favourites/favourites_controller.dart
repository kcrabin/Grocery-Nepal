import 'package:get/get.dart';
import 'package:grocery_nepal/data/local/favourite_local.dart';
import 'package:grocery_nepal/data/models/product/product.dart';

class FavouitesController extends GetxController {
  List<Product> favourites = [];

  @override
  void onInit() {
    super.onInit();
    getFavourites();
  }

  Future<void> getFavourites() async {
    favourites = await FavouriteLocal.get();
    update();
  }

  void addFavourite(Product product) {
    favourites.add(product);
    FavouriteLocal.set(favourites);
    update();
  }

  void removeFavourite(Product product) {
    favourites.removeWhere((element) => element.id == product.id);
    FavouriteLocal.set(favourites);
    update();
  }
}
