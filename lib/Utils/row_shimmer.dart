import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class ShimmerRow extends StatelessWidget {
  const ShimmerRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: 80.0, // Adjust the size as needed
            height: 80.0, // Adjust the size as needed
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ), // The color of the child
          ),
        ),
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: 80.0, // Adjust the size as needed
            height: 80.0, // Adjust the size as needed
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ), // The color of the child
          ),
        ),
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: 80.0, // Adjust the size as needed
            height: 80.0, // Adjust the size as needed
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ), // The color of the child
          ),
        ),
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: 80.0, // Adjust the size as needed
            height: 80.0, // Adjust the size as needed
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ), // The color of the child
          ),
        ),
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: 80.0, // Adjust the size as needed
            height: 80.0, // Adjust the size as needed
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ), // The color of the child
          ),
        ),

      ],
    );
  }
}
