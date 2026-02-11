import 'package:flutter/material.dart';
import 'package:goldy_app/core/constant/app_colors.dart';
import 'package:goldy_app/core/constant/app_strings.dart';
import 'package:goldy_app/core/widgets/custom_bottom.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          CustomBottom(
            text: AppStrings.gold, 
            onPressed: () {
              
            }, 
            color: AppColors.goldColor
          ),
          CustomBottom(
            text: AppStrings.silver, 
            onPressed: () {
              
            }, 
            color: AppColors.silverColor
          ),
        ],
      ),
    );
  }
}