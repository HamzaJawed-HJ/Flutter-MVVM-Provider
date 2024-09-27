import 'package:flutter/material.dart';
import 'package:mvvm_project/resources/colors.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isLoading;
  ButtonWidget(
      {super.key,
      required this.title,
      required this.onTap,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 200,
        decoration: BoxDecoration(
          color: AppColors.lightBlueColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: isLoading
              ? CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  title,
                  style: TextStyle(
                      color: AppColors.whiteColos, fontWeight: FontWeight.bold),
                ),
        ),
      ),
    );
  }
}
