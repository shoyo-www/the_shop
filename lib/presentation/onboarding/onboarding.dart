import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:the_shop/constants/Dimesnions.dart';
import 'package:the_shop/constants/constants.dart';
import 'package:the_shop/presentation/auth/login/login.dart';
import 'package:the_shop/widgets/dot_indicator.dart';
import 'package:the_shop/widgets/onboarding_content.dart';


class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({super.key});

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;
  final List<Onbord> _onbordData = [
    Onbord(
      image: "assets/Illustration/Illustration-0.png",
      imageDarkTheme: "assets/Illustration/Illustration_darkTheme_0.png",
      title: "Find the item you’ve \nbeen looking for",
      description:
      "Here you’ll see rich varieties of goods, carefully classified for seamless browsing experience.",
    ),
    Onbord(
      image: "assets/Illustration/Illustration-1.png",
      imageDarkTheme: "assets/Illustration/Illustration_darkTheme_1.png",
      title: "Get those shopping \nbags filled",
      description:
      "Add any item you want to your cart, or save it on your wishlist, so you don’t miss it in your future purchases.",
    ),
    Onbord(
      image: "assets/Illustration/Illustration-2.png",
      imageDarkTheme: "assets/Illustration/Illustration_darkTheme_2.png",
      title: "Fast & secure \npayment",
      description: "There are many payment options available for your ease.",
    ),
    Onbord(
      image: "assets/Illustration/Illustration-3.png",
      imageDarkTheme: "assets/Illustration/Illustration_darkTheme_3.png",
      title: "Package tracking",
      description:
      "In particular, Shoplon can pack your orders, and help you seamlessly manage your shipments.",
    ),
    Onbord(
      image: "assets/Illustration/Illustration-4.png",
      imageDarkTheme: "assets/Illustration/Illustration_darkTheme_4.png",
      title: "Nearby stores",
      description:
      "Easily track nearby shops, browse through their items and get information about their prodcuts.",
    ),
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, logInScreenRoute);
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge!.color),
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _onbordData.length,
                  onPageChanged: (value) {
                    setState(() {
                      _pageIndex = value;
                    });
                  },
                  itemBuilder: (context, index) => OnbordingContent(
                    title: _onbordData[index].title,
                    description: _onbordData[index].description,
                    image: (Theme.of(context).brightness == Brightness.dark &&
                        _onbordData[index].imageDarkTheme != null)
                        ? _onbordData[index].imageDarkTheme!
                        : _onbordData[index].image,
                    isTextOnTop: index.isOdd,
                  ),
                ),
              ),
              Row(
                children: [
                  ...List.generate(
                    _onbordData.length,
                        (index) => Padding(
                      padding: const EdgeInsets.only(right: defaultPadding / 4),
                      child: DotIndicator(isActive: index == _pageIndex),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_pageIndex < _onbordData.length - 1) {
                          _pageController.nextPage(
                              curve: Curves.ease, duration: defaultDuration);
                        } else {
                          Navigator.push(context, MaterialPageRoute(builder: (c)=> const LoginScreen()));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: const CircleBorder(),
                      ),
                      child: SvgPicture.asset(
                        height: Dimensions.h_15,
                        fit: BoxFit.cover,
                        "assets/icons/Arrow - Right.svg",
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: defaultPadding),
            ],
          ),
        ),
      ),
    );
  }
}

class Onbord {
  final String image, title, description;
  final String? imageDarkTheme;

  Onbord({
    required this.image,
    required this.title,
    this.description = "",
    this.imageDarkTheme,
  });
}

class OnbordingContent extends StatelessWidget {
  const OnbordingContent({
    super.key,
    this.isTextOnTop = false,
    required this.title,
    required this.description,
    required this.image,
  });

  final bool isTextOnTop;
  final String title, description, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),

        if (isTextOnTop)
          OnbordTitleDescription(
            title: title,
            description: description,
          ),
        if (isTextOnTop) const Spacer(),

        /// if you are using SVG then replace [Image.asset] with [SvgPicture.asset]

        Image.asset(
          image,
          height: 250,
        ),
        if (!isTextOnTop) const Spacer(),
        if (!isTextOnTop)
          const OnbordTitleDescription(
            title: "Find the item you’ve \nbeen looking for",
            description:
            "Here you’ll see rich varieties of goods, carefully classified for seamless browsing experience.",
          ),

        const Spacer(),
      ],
    );
  }
}


