import 'package:flutter/material.dart';

import '../../models/products.dart';
import '../../utility/colors.dart';
import '../../widgets/input_decorations.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<Products> _foundProducts = [];
  List<Products> _allProducts = [];

  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    _foundProducts = topProductsList;
    _allProducts = topProductsList;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Search Products'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: SizedBox(
                  height: 56,
                  child: TextField(
                    controller: _textEditingController,
                    autofocus: false,
                    onChanged: (value) {
                      _runFilter(value);
                    },
                    decoration: InputDecorations.buildInputDecoration_1(
                        hintText: "Search"),
                  ),
                ),
              ),
              buildRecommendations(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRecommendations() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recommended Products',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _foundProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.80,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, i) {
            return Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Image.asset(
                    _foundProducts[i].image,
                    fit: BoxFit.fill,
                    height: 120,
                  ),
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _foundProducts[i].name,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '★${_foundProducts[i].stars}',
                            style:
                                TextStyle(color: MyColor.golden, fontSize: 16),
                          ),
                          Text(
                            'Rs. ${_foundProducts[i].price}',
                            style: const TextStyle(
                                color: Colors.red, fontSize: 16),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  void _runFilter(String enteredKeyword) {
    List<Products> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allProducts;
    } else {
      results = _allProducts
          .where((user) => user.name
              .toString()
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundProducts = results;
    });
  }
}
