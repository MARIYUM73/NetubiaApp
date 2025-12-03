import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Constants/app_colors.dart'; 

// --- 1. BIG PRIMARY BUTTON (Login/Register etc) ---
class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool isLoading;
  final double? width;

  const PrimaryButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity, 
      height: 50.h, 
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.r), 
        gradient: const LinearGradient(
          colors: [AppColors.primaryCyan, AppColors.primaryBlue],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryBlue.withOpacity(0.4),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.r)
          ),
          padding: EdgeInsets.all(10.w), 
        ),
        child: isLoading
            ? const CircularProgressIndicator(color: Colors.white)
            : Text(
                title,
                style: TextStyle( 
                  color: Colors.white,
                  fontSize: 16.sp, 
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Gilroy',
                ),
              ),
      ),
    );
  }
}

// --- 2. SMALL PRIMARY BUTTON (Upload Photo etc) ---
class SmallPrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const SmallPrimaryButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // Gradient Top to Bottom (as per your snippet)
        gradient: const LinearGradient(
          colors: [AppColors.primaryCyan, AppColors.primaryBlue],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 12.h), 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 13.sp, 
            fontWeight: FontWeight.bold,
            fontFamily: 'Gilroy',
          ),
        ),
      ),
    );
  }
}