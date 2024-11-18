import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_shop/constants/Dimesnions.dart';
import 'package:the_shop/constants/constants.dart';


// For preview
class CategoryModel {
  final String name;
  final String? svgSrc, route;

  CategoryModel({
    required this.name,
    this.svgSrc,
    this.route,
  });
}

List<CategoryModel> demoCategories = [
  CategoryModel(name: "All Categories"),
  CategoryModel(
      name: "On Sale",
      svgSrc: "assets/icons/Sale.svg",
      route: ''),
  CategoryModel(name: "Man's", svgSrc: "assets/icons/Man.svg"),
  CategoryModel(name: "Woman’s", svgSrc: "assets/icons/Woman.svg"),
  CategoryModel(
      name: "Kids", svgSrc: "assets/icons/Child.svg", route: ''),
];
// End For Preview

class Categories extends StatelessWidget {
  const Categories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            demoCategories.length,
            (index) => Padding(
              padding: EdgeInsets.only(
                  left: index == 0 ? defaultPadding : defaultPadding / 2,
                  right:
                      index == demoCategories.length - 1 ? defaultPadding : 0),
              child: CategoryBtn(
                category: demoCategories[index].name,
                svgSrc: demoCategories[index].svgSrc,
                isActive: index == 0,
                press: () {
                  if (demoCategories[index].route != null) {
                    Navigator.pushNamed(context, demoCategories[index].route!);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryBtn extends StatelessWidget {
  const CategoryBtn({
    super.key,
    required this.category,
    this.svgSrc,
    required this.isActive,
    required this.press,
  });

  final String category;
  final String? svgSrc;
  final bool isActive;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      child: Column(
        children: [
          Container(
            height: Dimensions.h_50,
            width: Dimensions.h_50,
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            decoration: BoxDecoration(
              color: isActive ? primaryColor : Colors.transparent,
              border: Border.all(
                  color: isActive
                      ? Colors.transparent
                      : Theme.of(context).dividerColor),
              borderRadius: const BorderRadius.all(Radius.circular(30)),
            ),
          ),
          Text(
            category,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: isActive
                  ? Colors.white
                  : Theme.of(context).textTheme.bodyLarge!.color,
            ),
          ),
        ],
      ),
    );
  }
}
