import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBooksImage extends StatelessWidget {
  final String imageUrl;
  final double? aspectRatio;
  const CustomBooksImage({super.key, required this.imageUrl, this.aspectRatio});
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio ?? 2.5 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: CachedNetworkImage(
          filterQuality: FilterQuality.high,
          fit: BoxFit.cover,
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
              const Icon(Icons.broken_image_outlined, color: Colors.red),
          imageUrl: imageUrl,
        ),
      ),
    );
  }
}
