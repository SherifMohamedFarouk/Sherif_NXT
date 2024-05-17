import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleDisplayWidget extends StatelessWidget {
  const TitleDisplayWidget({
    super.key,
    required this.title,
    required this.desc,
    this.isStars = false , this.starRating = 5,
  });

  final String title, desc;
  final bool isStars;
  final double starRating;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.displayLarge!,
        ),
        SizedBox(
          height: 8.sp,
        ),
        isStars
            ? RatingBarIndicator(
                rating: starRating,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 50.0.sp,
                direction: Axis.horizontal,
              )
            : Text(
                desc,
                style: Theme.of(context).textTheme.displayMedium!,
              ),
      ],
    );
  }
}
