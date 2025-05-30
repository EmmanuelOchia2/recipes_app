import 'package:flutter/material.dart';

class RoundedSquaredImageWidget extends StatelessWidget {
  const RoundedSquaredImageWidget({
    super.key,
    required this.strMealThumb,
    this.height = 48,
    this.width = 48,
  });

  final String strMealThumb;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: NetworkImage(strMealThumb),
        ),
      ),
    );
  }
}
