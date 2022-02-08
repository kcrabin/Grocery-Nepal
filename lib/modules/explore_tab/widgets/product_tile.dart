import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/data/models/product.dart';
import 'package:grocery_nepal/modules/product_detail/product_detail_screen.dart';
import 'package:grocery_nepal/widgets/widgets.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetail(product: product),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(10),
            // border: Border.all(color: greyColor),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade300,
                  offset: const Offset(1, 1),
                  spreadRadius: 1,
                  blurRadius: 2)
            ]),
        height: 180,
        width: 130,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: imageUrl + product.image,
                  placeholder: (context, url) => const Loading(size: 100),
                  errorWidget: (context, url, error) => Image.asset(
                    'assets/images/dummy_image.png',
                    fit: BoxFit.cover,
                  ),
                ),

                // Image.network(
                //   imageUrl + product.image,
                //   errorBuilder: (context, url, error) {
                //     return Image.asset("assets/images/dummy_image.png");
                //   },
                // ),
                // CachedNetworkImage(
                //   imageUrl: imageUrl + product.image,
                //   placeholder: (context, url) => const Loading(),
                //   errorWidget: (context, url, error) =>
                //       Image.asset("assets/images/dummy_image.png"),
                // ),
              ),
            ),
            Text(
              product.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Rs. ${product.price}'),
                InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Added to cart'),
                          duration: Duration(milliseconds: 1000),
                          backgroundColor: greenColor),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                        color: greenColor,
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(5),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
