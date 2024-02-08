import 'package:flutter/material.dart';

class ProductDetailsImage extends StatelessWidget {
  const ProductDetailsImage({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:20.0,right: 20.0,top: 5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2.2,
          decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: NetworkImage(image),
              )),
        ),
      ),
    );
  }
}
