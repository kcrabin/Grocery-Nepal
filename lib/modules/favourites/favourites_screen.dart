import 'package:flutter/material.dart';
import 'package:grocery_nepal/data/models/product/product.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  final List<Product> favourites = [
    Product(
        category: 'Fruites',
        description: 'this is healthy',
        id: 1,
        image: 'assets/images/dummy_image.png',
        name: 'cabbage',
        unit: '5',
        price: 300),
    Product(
        category: 'Fruites',
        description: 'this is healthy',
        id: 1,
        image: 'assets/images/dummy_image.png',
        name: 'cabbage',
        unit: '5',
        price: 300),
    Product(
        category: 'Fruites',
        description: 'this is healthy',
        id: 1,
        image: 'assets/images/dummy_image.png',
        name: 'cabbage',
        unit: '5',
        price: 300),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favourites'),
        ),
        body: ListView.builder(
          itemCount: favourites.length,
          itemBuilder: (context, index) => Card(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                  leading: Image.asset(favourites[index].image),
                  title: Text(favourites[index].name),
                  trailing: IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text(
                                    'Do You Want to Remove from favourites?'),
                                // content: Text('This is content'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        favourites.removeAt(index);
                                      });

                                      Navigator.pop(context);
                                    },
                                    child: Text('Remove'),
                                  ),
                                ],
                              ));
                    },
                    icon: Icon(Icons.delete),
                  )),
            ),
          ),
        ));
  }
}
