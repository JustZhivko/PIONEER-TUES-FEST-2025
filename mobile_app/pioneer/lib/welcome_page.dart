import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background_image.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center),
        ),
      ),
    );
  }
}
