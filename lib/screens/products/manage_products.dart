import 'package:biz_link/models/products.dart';
import 'package:biz_link/screens/products/add_product.dart';
import 'package:biz_link/screens/products/edit_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utility/colors.dart';

class ManageProducts extends StatefulWidget {
  const ManageProducts({Key? key}) : super(key: key);

  @override
  State<ManageProducts> createState() => _ManageProductsState();
}

class _ManageProductsState extends State<ManageProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Manage Products',
        ),
        backgroundColor: MyColor.accent_color,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const AddProduct());
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const Text(
              'Products',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: userProductsList.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    leading: Image.asset(
                      userProductsList[i].image,
                      height: 40,
                      width: 40,
                    ),
                    title: Text(userProductsList[i].name),
                    trailing: FittedBox(
                      fit: BoxFit.fill,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.to(() =>
                                  EditProduct(product: userProductsList[i]));
                            },
                            icon: const Icon(Icons.edit),
                            color: MyColor.accent_color,
                          ),
                          IconButton(
                            onPressed: () {
                              Get.defaultDialog(
                                title:
                                    'Are you sure want to delete ${userProductsList[i].name}',
                                content: Column(
                                  children: [
                                    SizedBox(
                                      height: 60,
                                      child: Image.asset(
                                          userProductsList[i].image),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                              onPressed: () {
                                                userProductsList.removeAt(i);
                                                setState(() {});
                                                Get.back();
                                              },
                                              child: const Text('Yes')),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: ElevatedButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              child: const Text('No')),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                            icon: const Icon(Icons.delete_forever),
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
