import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../models/products.dart';
import '../../models/sellers.dart';
import '../../utility/colors.dart';
import 'product_details_screen.dart';

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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Home Page'),
        backgroundColor: MyColor.accent_color,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              buildTopRated(),
              const SizedBox(
                height: 20,
              ),
              buildBanner(),
              Center(child: buildDots()),
              productsShow(
                title: 'Top Rated Products',
                products: topProductsList,
              ),
              buildRecommendations(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTopRated() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Top Rated Sellers',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 13.h,
          child: ListView.builder(
            itemCount: topRatedSellerLists.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(1000),
                      child: Image.asset(
                        topRatedSellerLists[i].profilePicture,
                        fit: BoxFit.fill,
                        height: 8.h,
                        width: 8.h,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(topRatedSellerLists[i].lastName),
                  ],
                ),
              );
            },
          ),
        ),
      ],
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
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: topProductsList.length,
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
                    topProductsList[i].image,
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
                            topProductsList[i].name,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '★' + topProductsList[i].stars.toString(),
                            style:
                                TextStyle(color: MyColor.golden, fontSize: 16),
                          ),
                          Text(
                            'Rs. ' + topProductsList[i].price.toString(),
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

  Widget buildBanner() {
    return CarouselSlider(
      options: CarouselOptions(
          aspectRatio: 338 / 140,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5),
          autoPlayAnimationDuration: const Duration(milliseconds: 1000),
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
            padding:
                const EdgeInsets.only(left: 18, right: 18, top: 0, bottom: 20),
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
                          offset: const Offset(
                              0.0, 10.0), // shadow direction: bottom right
                        )
                      ],
                    ),
                    child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(6)),
                        child: Image.asset(
                          homeBannersList[i].image,
                          height: 140,
                          fit: BoxFit.cover,
                        ))),
              ],
            ),
          )
      ],
    );
  }

  Widget productsShow({String title = 'watch', var products}) {
    return SizedBox(
      height: 25.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 5,
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

  Widget buildDots() {
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
