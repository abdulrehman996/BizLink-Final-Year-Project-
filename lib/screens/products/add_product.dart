import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import '../../utility/colors.dart';
import '../../widgets/input_decorations.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productIdController = TextEditingController();
  final TextEditingController _productImageController = TextEditingController();
  final TextEditingController _productDescriptionController =
      TextEditingController();

  final picker = ImagePicker();
  String? imageName;
  String? imagePath;
  File? _image;

  Future _getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    File imageFile = File(pickedFile!.path);
    setState(() {
      _image = imageFile;
      imageName = pickedFile.name;
      imagePath = pickedFile.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Products'),
        backgroundColor: MyColor.accent_color,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            height: 35.h,
            width: 100.w,
            color: MyColor.accent_color,
          ),
          CustomScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    InkWell(
                      onTap: () {
                        _getImage();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 48.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _image != null
                                ? CircleAvatar(
                                    radius: 6.h,
                                    backgroundImage: FileImage(_image!),
                                    backgroundColor: Colors.transparent,
                                  )
                                : CircleAvatar(
                                    radius: 6.h,
                                    backgroundImage: AssetImage(
                                        'assets/products/blender.jpg'),
                                    backgroundColor: Colors.transparent,
                                  )
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 20.0, top: 10),
                      child: Text(
                        'Add Image',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 18.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.08),
                              blurRadius: 20,
                              spreadRadius: 0.0,
                              offset: const Offset(0.0, 10.0),
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Text(
                                'Product Name',
                                style: TextStyle(
                                    color: MyColor.accent_color,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: SizedBox(
                                height: 36,
                                child: TextField(
                                  controller: _productNameController,
                                  autofocus: false,
                                  decoration:
                                      InputDecorations.buildInputDecoration_1(
                                          hintText: "Product"),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Text(
                                'Product Price',
                                style: TextStyle(
                                    color: MyColor.accent_color,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    height: 36,
                                    child: TextField(
                                      controller: _productIdController,
                                      autofocus: false,
                                      decoration: InputDecorations
                                          .buildInputDecoration_1(
                                              hintText: "e.g. 100"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Text(
                                'Description',
                                style: TextStyle(
                                    color: MyColor.accent_color,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: SizedBox(
                                height: 250,
                                child: TextField(
                                  controller: _productDescriptionController,
                                  autofocus: false,
                                  maxLines: 120,
                                  decoration:
                                      InputDecorations.buildInputDecoration_1(
                                          hintText: "Description"),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: MyColor.text_field_grey,
                                        width: 1),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(12.0))),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    primary: MyColor.accent_color,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(6.0))),
                                    fixedSize: Size.fromWidth(
                                        MediaQuery.of(context).size.width),
                                  ),
                                  child: const Text(
                                    'Save',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  onPressed: () {
                                    // onPressedLogin();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
