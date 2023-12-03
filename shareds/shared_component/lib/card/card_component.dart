import 'package:flutter/material.dart';
import 'package:shared_component/images/image_network_component.dart';

class CardComponent extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final Function() onTap;
  const CardComponent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 300.0,
        child: Card(
          margin: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageNetworkComponent(
                  image: image,
                ),
                const SizedBox.square(
                  dimension: 12.0,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                ),
                const SizedBox.square(
                  dimension: 12.0,
                ),
                Text(
                  description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
