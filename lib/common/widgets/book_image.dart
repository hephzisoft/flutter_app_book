import 'package:flutter/material.dart';

class BookImage extends StatelessWidget {
  const BookImage({
    super.key,
    this.url = '',
    this.id = '',
  });

  final String url;
  final String id;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: InkWell(
        onTap: () {},
        child: Image.network(
          url,
          // fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
