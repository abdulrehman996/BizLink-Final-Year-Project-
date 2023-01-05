import 'package:biz_link/screens/home/product_details_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../models/products.dart';
import '../../utility/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int yourActiveIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: MyColor.accent_color,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              CarouselSlider(
                options: CarouselOptions(
                    aspectRatio: 338 / 140,
                    viewportFraction: 1,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 5),
                    autoPlayAnimationDuration: Duration(milliseconds: 1000),
                    autoPlayCurve: Curves.easeInExpo,
                    enlargeCenterPage: false,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      setState(() {
                        yourActiveIndex = index;
                      });
                    }),
                items: [
                  for (int i = 0; i < homeBannersList.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 18, right: 18, top: 0, bottom: 20),
                      child: Stack(
                        children: <Widget>[
                          Container(
                              //color: Colors.amber,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(.08),
                                    blurRadius: 20,
                                    spreadRadius: 0.0,
                                    offset: Offset(0.0,
                                        10.0), // shadow direction: bottom right
                                  )
                                ],
                              ),
                              child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                  child: Image.asset(
                                    homeBannersList[i].image,
                                    height: 140,
                                    fit: BoxFit.cover,
                                  ))),
                        ],
                      ),
                    )
                ],
              ),
              Center(child: buildDots()),
              productsShow(
                title: 'Watches',
                products: watchesList,
              ),
              productsShow(
                title: 'Bags',
                products: bagsList,
              ),
              productsShow(
                title: 'Juicer',
                products: juicersList,
              ),
              productsShow(
                title: 'Watches',
                products: homeProductsList,
              ),
              productsShow(
                title: 'Watches',
                products: homeProductsList,
              ),
              productsShow(
                title: 'Watches',
                products: homeProductsList,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container productsShow({String title = 'watch', var products}) {
    return Container(
      height: 25.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: () {
                    Get.to(() => ProductDetail(products: products[i]));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Container(
                      // width: 20.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15.h,
                            child: Image.asset(
                              products[i].image,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Center(
                            child: Text(products[i].name),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Padding buildDots() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: AnimatedSmoothIndicator(
        activeIndex: yourActiveIndex,
        count: homeBannersList.length,
        effect: ScrollingDotsEffect(
          activeDotColor: MyColor.dots_color,
          activeStrokeWidth: 2.6,
          activeDotScale: 1.5,
          maxVisibleDots: 5,
          radius: 8,
          spacing: 8,
          dotHeight: 6,
          dotWidth: 6,
        ),
      ),
    );
  }
}
