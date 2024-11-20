import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_shop/constants/Dimesnions.dart';
import 'package:the_shop/constants/constants%202.dart';
import 'package:the_shop/constants/constants.dart';
import 'package:the_shop/presentation/product/product_controller.dart';
import 'package:the_shop/widgets/network_image.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.put(ProductController());
    return Container(
      color: whiteColor,
      child: SafeArea(
        top: false,
        child: Scaffold(
          body: GetBuilder(
            id: ControllerBuilders.productController,
            init: productController,
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: Dimensions.h_230,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                        color:  borderGrey,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(Dimensions.h_25),bottomRight: Radius.circular(Dimensions.h_25))
                    ),
                    child: const NetworkImageWithLoader(
                      '',
                      fit: BoxFit.cover,
                    ),
                  ),

                  SizedBox(
                    height: Dimensions.h_60,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: controller.product?.images?.length ?? 0,
                      itemBuilder: (c,i) {
                      return Container(
                      height: Dimensions.h_50,
                      width: Dimensions.h_50,
                      decoration: BoxDecoration(
                          color:  borderGrey,
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(Dimensions.h_25),bottomRight: Radius.circular(Dimensions.h_25))
                      ),
                      child:  NetworkImageWithLoader(
                        controller.product?.images?[i] ?? "",
                        fit: BoxFit.cover,
                      ),
                    );}),
                  ),

                  // Product Info Section
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Air Jordan 3 Retro',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          '\$200',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Rise to the occasion in style that soars. This shoe reworks an icon\'s original magic with a platform sole and low cut silhouette.',
                          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                        ),
                        const SizedBox(height: 16),
                        const Row(
                          children: [
                            TagWidget(label: 'Women'),
                            SizedBox(width: 8),
                            TagWidget(label: 'Highly Rated'),
                            SizedBox(width: 8),
                            TagWidget(label: '5 pair left'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Size Selection
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Select Size',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizeChip(label: 'UK 6'),
                            SizeChip(label: 'UK 7'),
                            SizeChip(label: 'UK 8', isSelected: true),
                            SizeChip(label: 'UK 9'),
                            SizeChip(label: 'UK 10'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  // Action Buttons
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Add to Cart',
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Buy Now',
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class TagWidget extends StatelessWidget {
  final String label;
  const TagWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
      ),
    );
  }
}

class SizeChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const SizeChip({super.key, required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.orange[300] : Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
