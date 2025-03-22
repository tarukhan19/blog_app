import 'package:flutter/material.dart';

import '../../../../core/theme/app_pallete.dart';

class AuthGradientButton extends StatelessWidget {
  final String title;
  const AuthGradientButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppPallete.gradient1, AppPallete.gradient2],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          fixedSize: Size(395, 55),
          backgroundColor: AppPallete.transparentColor,
          shadowColor: AppPallete.transparentColor
        ),
        child: Text(
          title,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
