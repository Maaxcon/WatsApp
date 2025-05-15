import 'package:flutter/material.dart';

class FadeInNetImage extends StatelessWidget {
  final String placeholderImage;
  
  const FadeInNetImage({
    Key? key,
    required this.placeholderImage,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: Colors.grey[300],
      child: const Icon(Icons.person, size: 30),
    );
  }
}