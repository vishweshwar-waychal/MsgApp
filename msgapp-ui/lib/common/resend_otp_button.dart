import 'package:flutter/material.dart';

class CustomButton2 extends StatelessWidget {
  const CustomButton2({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: width * 0.04,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
