import 'package:bloc_demo/extension/extensions.dart';
import 'package:flutter/material.dart';
 
class ProductWidget extends StatelessWidget {
  const ProductWidget(
      {super.key,
      required this.title,
      required this.category,
      required this.price,
      required this.productImage});
  final String title;
  final String category;
  final String price;
  final String productImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1, color: Colors.grey)),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
              ),
              child: Center(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(productImage),
              )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: 100,
                        child:
                            title.titleText(overflow: TextOverflow.ellipsis)),
                    SizedBox(
                      width: 100,
                      child: category.categoryText(
                          overflow: TextOverflow.ellipsis),
                    )
                  ],
                ),
                const Spacer(),
                price.withCurrencyText()
              ],
            ),
          )
        ],
      ),
    );
  }
}
