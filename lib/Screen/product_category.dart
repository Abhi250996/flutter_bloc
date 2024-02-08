import 'package:bloc_demo/Widget/gridview_widget.dart';
import 'package:bloc_demo/app_constants.dart';
import 'package:flutter/material.dart';
 
class ProductCategoryScreen extends StatefulWidget {
  const ProductCategoryScreen({super.key});

  @override
  State<ProductCategoryScreen> createState() => _ProductCategoryScreenState();
}

class _ProductCategoryScreenState extends State<ProductCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.category),
        centerTitle: true,
      ),
      body:   GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 5, crossAxisCount: 2, childAspectRatio: .9),
          itemCount: 20,
          shrinkWrap: true,
          itemBuilder: (context, index) => const Padding(
            padding:    EdgeInsets.all(4.0),
            child:   ProductWidget(title: "Title",category:"Title" ,price:"Title" ,productImage: "Title"),
          )),
    );
  }
}
