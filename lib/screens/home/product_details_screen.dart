import 'package:flutter/material.dart';

import '../../models/products.dart';
import '../../utility/colors.dart';

class ProductDetail extends StatefulWidget {
  final Products products;

  const ProductDetail({Key? key, required this.products}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Product Detail"),
        backgroundColor: MyColor.accent_color,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("i Am ${widget.products.name} "),
            Image.asset(widget.products.image),
          ],
        ),
      ),
    );
  }
}
