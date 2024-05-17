import 'package:flutter/material.dart';

class CustomRichWidget extends StatelessWidget {
  const CustomRichWidget({
    super.key,
    required this.title,
    required this.desc,
  });

  final String title, desc;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: title,
        style: Theme.of(context).textTheme.displayLarge!,
        children: <TextSpan>[
          TextSpan(
            text: desc,
            style: Theme.of(context).textTheme.displayMedium!,
          ),
        ],
      ),
    );
  }
}
