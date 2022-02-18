import 'package:flutter/material.dart';

class ImagePlaceholder extends StatelessWidget {
  const ImagePlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue,
            width: 2
          ),
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          color: const Color.fromRGBO(0, 0, 0, 0.05),
      ),
      child: const Center(
        child: Icon(
          Icons.photo_rounded,
          color: Colors.blue,
        ),
      ),
    );
  }
}