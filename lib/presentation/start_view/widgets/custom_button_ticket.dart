import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.screenWidth, this.isBorder = false, required this.text, required this.style, this.onTap,this.onlyText = false
  });

  final double screenWidth;
  final bool isBorder,onlyText;
  final String text;
  final TextStyle style;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: onlyText?Center(
        child: Text(
          text,
          style: style,
        ),
      ):Container(
        margin: const EdgeInsets.fromLTRB(5, 0, 0, 24),
        child: Container(
          decoration: isBorder? BoxDecoration(
            border: Border.all(
                color: Theme.of(context).colorScheme.primaryContainer),
          ): BoxDecoration(
            color:  Theme.of(context).colorScheme.primaryContainer,
          ),
          width: screenWidth*0.85,
          padding: const EdgeInsets.fromLTRB(0, 14.5, 0, 14.5),
          child:
          Center(
            child: Text(
              text,
              style: style,
            ),
          ),
        ),
      ),
    );
  }
}