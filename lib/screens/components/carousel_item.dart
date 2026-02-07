// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CarouselItem extends StatelessWidget {
  final String imagePath;
  final String text;
  const CarouselItem({
    Key? key,
    required this.imagePath,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/carousel/$imagePath'),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 36,
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontFamily: 'Bigelow Rules'),
        ),
      ],
    );
  }
}
