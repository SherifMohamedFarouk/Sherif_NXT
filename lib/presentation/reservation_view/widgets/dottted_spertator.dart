import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MySeparator extends StatelessWidget {
  const MySeparator({super.key, this.height = 1, this.color = Colors.grey});
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: EdgeInsets.only(left: 50.0.sp, right: 50.0.sp),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final boxWidth = constraints.constrainWidth();
          const dashWidth = 5.0;
          final dashHeight = height;
          final dashCount = (boxWidth / (2 * dashWidth)).floor();
          // separator that is dotted to fit the ticket design and separate  in the middle
          return Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
            children: List.generate(dashCount, (_) {
              return SizedBox(
                width: dashWidth,
                height: dashHeight,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: color),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}