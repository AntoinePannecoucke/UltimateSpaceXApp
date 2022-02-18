import 'package:flutter/material.dart';

class ImagePlaceholder extends StatelessWidget {
  const ImagePlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          color: Colors.black
      ),
      child: const Center(
        child: Icon(
          Icons.photo_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}