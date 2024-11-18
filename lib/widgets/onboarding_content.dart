import 'package:flutter/material.dart';
import 'package:the_shop/constants/constants.dart';

class OnbordTitleDescription extends StatelessWidget {
  const OnbordTitleDescription({
    super.key,
    required this.title,
    required this.description,
  });

  final String title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: defaultPadding),
        Text(
          description,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}