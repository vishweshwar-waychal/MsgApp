import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: double.infinity,
      height: width * 0.13,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(width * 0.02),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(fontSize: width * 0.045, color: Colors.white),
        ),
      ),
    );
  }
}
