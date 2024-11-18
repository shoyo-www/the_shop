import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_shop/constants/constants.dart';
import 'package:the_shop/widgets/banner_m.dart';
import 'package:the_shop/widgets/dot_indicator.dart';


class OffersCarousel extends StatefulWidget {
  const OffersCarousel({
    super.key,
  });

  @override
  State<OffersCarousel> createState() => _OffersCarouselState();
}

class _OffersCarouselState extends State<OffersCarousel> {
  int _selectedIndex = 0;
  late PageController _pageController;
  late Timer _timer;

  // Offers List
  List offers = [
    BannerMStyle1(
      text: "New items with \nFree shipping",
      press: () {},
    ),
    BannerMStyle2(
      title: "Black \nfriday",
      subtitle: "Collection",
      discountParcent: 50,
      press: () {},
    ),
    BannerMStyle3(
      title: "Grab \nyours now",
      discountParcent: 50,
      press: () {},
    ),
    BannerMStyle4(
      // image: , user your image
      title: "SUMMER \nSALE",
      subtitle: "SPECIAL OFFER",
      discountParcent: 80,
      press: () {},
    ),
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (_selectedIndex < offers.length - 1) {
        _selectedIndex++;
      } else {
        _selectedIndex = 0;
      }

      _pageController.animateToPage(
        _selectedIndex,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutCubic,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.87,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: offers.length,
            onPageChanged: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            itemBuilder: (context, index) => offers[index],
          ),
          FittedBox(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: SizedBox(
                height: 16,
                child: Row(
                  children: List.generate(
                    offers.length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: defaultPadding / 4),
                        child: DotIndicator(
                          isActive: index == _selectedIndex,
                          activeColor: Colors.white70,
                          inActiveColor: Colors.white54,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}


class BannerMStyle1 extends StatelessWidget {
  const BannerMStyle1({
    super.key,
    this.image = "https://i.imgur.com/UP7xhPG.png",
    required this.text,
    required this.press,
  });
  final String? image;
  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return BannerM(
      image: image!,
      press: press,
      children: [
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(flex: 2),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Text(
                  text,
                  style: const TextStyle(
                    fontFamily: grandisExtendedFont,
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
              const Spacer(),
              const Text(
                "Shop now",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 64,
                child: Divider(
                  color: Colors.white,
                  thickness: 2,
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ],
    );
  }
}


class BannerMStyle2 extends StatelessWidget {
  const BannerMStyle2({
    super.key,
    this.image = "https://i.imgur.com/J1Qjut7.png",
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
    return BannerM(
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
          child: BannerDiscountTag(percentage: discountParcent),
        ),
      ],
    );
  }
}


class BannerDiscountTag extends StatelessWidget {
  const BannerDiscountTag({
    super.key,
    this.width = 36,
    this.height = 60,
    required this.percentage,
    this.percentageFontSize = 10,
  });
  final double width, height;
  final int percentage;
  final double percentageFontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            "assets/icons/Discount_tag.svg",
            fit: BoxFit.fill,
            colorFilter:
            const ColorFilter.mode(Colors.white70, BlendMode.srcIn),
          ),
          Text(
            "$percentage%\noff",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: grandisExtendedFont,
              color: Colors.black54,
              fontSize: percentageFontSize,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}


class BannerMStyle3 extends StatelessWidget {
  const BannerMStyle3({
    super.key,
    this.image = "https://i.imgur.com/8REExBV.png",
    required this.title,
    required this.press,
    required this.discountParcent,
  });
  final String? image;
  final String title;
  final int discountParcent;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return BannerM(
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
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding / 2,
                          vertical: defaultPadding / 8),
                      color: Colors.white70,
                      child: Text(
                        "$discountParcent% off",
                        style: const TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(height: defaultPadding / 2),
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
      ],
    );
  }
}


class BannerMStyle4 extends StatelessWidget {
  const BannerMStyle4({
    super.key,
    this.image = "https://i.imgur.com/R4iKkDD.png",
    required this.title,
    required this.press,
    required this.discountParcent,
    this.subtitle,
  });
  final String? image;
  final String title;
  final String? subtitle;
  final int discountParcent;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return BannerM(
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
                    if (subtitle != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding / 2,
                            vertical: defaultPadding / 8),
                        color: Colors.white70,
                        child: Text(
                          subtitle!,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    const SizedBox(height: defaultPadding / 2),
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
                    // const SizedBox(height: defaultPadding / 4),
                    Text(
                      "UP TO $discountParcent% OFF",
                      style: const TextStyle(
                        fontFamily: grandisExtendedFont,
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    )
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
      ],
    );
  }
}
