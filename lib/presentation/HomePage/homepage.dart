import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:the_shop/constants/Dimesnions.dart';
import 'package:the_shop/constants/appTextStyle.dart';
import 'package:the_shop/constants/constants%202.dart';
import 'package:the_shop/constants/constants.dart';
import 'package:the_shop/presentation/HomePage/components/best_sellers.dart';
import 'package:the_shop/presentation/HomePage/components/categories.dart';
import 'package:the_shop/presentation/HomePage/components/offers_carousel.dart';
import 'package:the_shop/presentation/HomePage/homepage_controller.dart';
import 'package:the_shop/widgets/network_image.dart';
import 'components/flash_sale.dart';
import 'components/most_popular.dart';
import 'components/offer_carousel_and_categories.dart';
import 'components/popular_products.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return GetBuilder(
      init: homeController,
      id: ControllerBuilders.homeController,
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: defaultPadding / 2),
                        Padding(
                          padding: const EdgeInsets.all(defaultPadding),
                          child: Text(
                            "Brands",
                            style: AppTextStyle.normalTextStyle(
                                FontSize.sp_20,Colors.black
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ...List.generate(
                                controller.category.length,
                                    (index) => Padding(
                                    padding: EdgeInsets.only(
                                        left: index == 0
                                            ? defaultPadding
                                            : defaultPadding,
                                        right: index == controller.category.length - 1
                                            ? defaultPadding
                                            : 0),
                                    child: InkWell(
                                      onTap: () {},
                                      child: Column(
                                        children: [
                                          Container(
                                              padding: EdgeInsets.all(Dimensions.h_8),
                                              decoration: BoxDecoration(
                                                  color: const Color(0xFFf4f4f5),
                                                  borderRadius: BorderRadius.circular(Dimensions.h_25)
                                              ),
                                              height: Dimensions.h_50,
                                              width: Dimensions.h_50,
                                              child: NetworkImageWithLoader(controller.category[index].image ?? '',fit: BoxFit.contain,radius: Dimensions.h_25)),
                                          Text(
                                            controller.category[index].name ?? '',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Theme.of(context).textTheme.bodyLarge!.color,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: defaultPadding * 2)
                      ],
                    )),
                SliverToBoxAdapter(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 2.0,
                      viewportFraction: 0.95,
                    ),
                    items: controller.bannerList.map((url) {
                      return Builder(
                        builder: (BuildContext context) {
                          return NetworkImageWithLoader(url.image ?? '',
                              fit: BoxFit.cover, radius: Dimensions.h_10);
                        },
                      );
                    }).toList(),
                  ),
                ),
                 SliverToBoxAdapter(child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: defaultPadding / 2),
                    Padding(
                      padding: const EdgeInsets.all(defaultPadding),
                      child: Text(
                        "Popular products",
                        style: AppTextStyle.normalTextStyle(
                             FontSize.sp_20,Colors.black
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.h_80,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: controller.products.length,
                        itemBuilder: (context, index) => Padding(
                          padding:  EdgeInsets.symmetric(horizontal: Dimensions.w_10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.h_10),
                              border: Border.all(color: blackColor10)
                            ),
                            width: Dimensions.w_200,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(child: NetworkImageWithLoader(controller.products[index].images?[0] ?? '', radius: defaultBorderRadious,fit: BoxFit.cover)),
                                const SizedBox(width: defaultPadding / 3),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(defaultPadding / 2),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.products[index].productName?.toUpperCase() ?? '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(fontSize: 10),
                                        ),
                                        const SizedBox(height: defaultPadding / 2),
                                        Text(
                                          controller.products[index].description ?? '',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(fontSize: 12),
                                        ),
                                        const Spacer(),
                                         Text(
                                          "\u{20B9}${controller.products[index].productPrice.toString()}",
                                          style: TextStyle(
                                            color: primaryColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: FontSize.sp_12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: defaultPadding * 1.5),
                  sliver: SliverToBoxAdapter(child: BannerMWithCounter(
                    duration: const Duration(hours: 8),
                    text: "Super Flash Sale \n50% Off",
                    press: () {},
                  ),),
                ),

                SliverToBoxAdapter(child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(defaultPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Products",
                            style: AppTextStyle.normalTextStyle(
                                FontSize.sp_20,Colors.black
                            ),
                          ),
                          Text(
                            "All products",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontSize: FontSize.sp_10)
                          ),
                        ],
                      ),
                    ),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding:  EdgeInsets.symmetric(horizontal: Dimensions.w_10),
                      gridDelegate:
                           SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5.0,
                        crossAxisSpacing: Dimensions.w_10,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: controller.products.length,
                      itemBuilder: (context, index) {
                        final product = controller.products[index];

                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: Dimensions.h_150,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFf4f4f5),
                                  borderRadius: BorderRadius.circular(Dimensions.h_12)
                                ),
                                child: NetworkImageWithLoader(
                                  product.images?[0] ??
                                      'https://via.placeholder.com/150',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.productName ?? 'Product Name',
                                      style:  TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: Dimensions.h_12,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4.0),
                                    Text(
                                      '\$${product.productPrice?.toString() ?? '0.00'}',
                                      style:  TextStyle(
                                        fontSize: Dimensions.h_13,
                                        fontWeight: FontWeight.bold,
                                        color: primaryMaterialColor.shade300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  ],
                )),
                SliverToBoxAdapter(child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: defaultPadding / 2),
                    Padding(
                      padding: const EdgeInsets.all(defaultPadding),
                      child: Text(
                        "Recommend",
                        style: AppTextStyle.normalTextStyle(
                            FontSize.sp_20,Colors.black
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.h_80,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: controller.products.length,
                        itemBuilder: (context, index) => Padding(
                          padding:  EdgeInsets.symmetric(horizontal: Dimensions.w_10),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(Dimensions.h_10),
                                border: Border.all(color: blackColor10)
                            ),
                            width: Dimensions.w_200,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(child: NetworkImageWithLoader(controller.products[index].images?[0] ?? '', radius: defaultBorderRadious,fit: BoxFit.cover)),
                                const SizedBox(width: defaultPadding / 3),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(defaultPadding / 2),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.products[index].productName?.toUpperCase() ?? '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(fontSize: 10),
                                        ),
                                        const SizedBox(height: defaultPadding / 2),
                                        Text(
                                          controller.products[index].description ?? '',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(fontSize: 12),
                                        ),
                                        const Spacer(),
                                        Text(
                                          "\u{20B9}${controller.products[index].productPrice.toString()}",
                                          style: TextStyle(
                                            color: primaryColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: FontSize.sp_12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )),
              ],
            ),
          ),
        );
      },
    );
  }
}

class BannerSStyle1 extends StatelessWidget {
  const BannerSStyle1({
    super.key,
    this.image = "https://i.imgur.com/K41Mj7C.png",
    required this.title,
    required this.press,
    this.subtitle,
    required this.discountParcent,
  });

  final String? image;
  final String title;
  final String? subtitle;
  final int discountParcent;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return BannerS(
      image: image!,
      press: press,
      children: [
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title.toUpperCase(),
                      style: const TextStyle(
                        fontFamily: grandisExtendedFont,
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        height: 1,
                      ),
                    ),
                    const SizedBox(height: defaultPadding / 4),
                    if (subtitle != null)
                      Text(
                        subtitle!.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: defaultPadding),
              SizedBox(
                height: 48,
                width: 48,
                child: ElevatedButton(
                  onPressed: press,
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: Colors.white,
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/Arrow - Right.svg",
                    colorFilter:
                        const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: BannerDiscountTag(
            percentage: discountParcent,
            height: 56,
          ),
        ),
      ],
    );
  }
}

class BannerS extends StatelessWidget {
  const BannerS(
      {super.key,
      required this.image,
      required this.press,
      required this.children});

  final String image;
  final VoidCallback press;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.56,
      child: GestureDetector(
        onTap: press,
        child: Stack(
          children: [
            NetworkImageWithLoader(image, radius: 0),
            Container(color: Colors.black45),
            ...children,
          ],
        ),
      ),
    );
  }
}
