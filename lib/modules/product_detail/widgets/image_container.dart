import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:grocery_nepal/widgets/loading.dart';

import '../../../constants.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      height: 200,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: greenColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: CachedNetworkImage(
          imageUrl: imageUrl + image,
          placeholder: (context, url) => const Loading(size: 100),
          errorWidget: (context, url, error) => Image.asset(
            'assets/images/dummy_image.png',
            fit: BoxFit.fitHeight,
          ),
        ),
        // Image.network(
        //   imageUrl + image,
        //   fit: BoxFit.fitHeight,
        // ),
      ),
    );
  }
}
