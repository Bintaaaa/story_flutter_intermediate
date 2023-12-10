import 'package:flutter/material.dart';

class ImageNetworkComponent extends StatelessWidget {
  final String image;
  const ImageNetworkComponent({super.key, double? height, required this.image}) : _height = height ?? 200.0;
  final double _height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        12.0,
      ),
      child: Image.network(
        image,
        fit: BoxFit.cover,
        height: _height,
        width: double.infinity,
        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
        errorBuilder: (context, err, track) => Container(
          width: double.maxFinite,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.grey,
          ),
          child: const Center(
            child: Icon(
              Icons.image_not_supported,
            ),
          ),
        ),
      ),
    );
  }
}
