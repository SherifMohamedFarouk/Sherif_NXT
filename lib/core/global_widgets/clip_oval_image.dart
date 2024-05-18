import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ClipOvalImage extends StatelessWidget {
  const ClipOvalImage({super.key, required this.width, required this.height, required this.url});
  final double width,height;
  final String? url ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: url??"https://res.cloudinary.com/swtchcc/image/upload/c_scale,w_2800/ar_3:4,c_thumb,g_face,h_1512,z_0.80/v1682589758/userDocs/hvzsye0h3w8f6ud1cuwj.jpg",
          placeholder: (context, url) => Image.asset('assets/images/place-holder.jpg'),
        ),
      ),
    );
  }
}
