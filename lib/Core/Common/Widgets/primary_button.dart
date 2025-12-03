import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Responsive size k liye
import '../../constants/app_colors.dart'; 

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
      // Design ma Width: Fixed (326px) hai. 
      // Agar width parameter null hai, to ye parent ki padding (24px) k hisaab se
      // khud 326px ban jayega (375 - 24 - 24 ≈ 327).
      width: width ?? double.infinity, 
      
      // 1. Height Updated: 50px
      height: 50.h, 
      
      decoration: BoxDecoration(
        // 2. Radius Updated: 18px
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
          
          // 3. Shape Radius Updated (Container se match hona chahiye)
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.r)
          ),
          
          // 4. Padding Updated: 10px
          padding: EdgeInsets.all(10.w), 
        ),
        child: isLoading
            ? const CircularProgressIndicator(color: Colors.white)
            : Text(
                title,
                style: TextStyle( 
                  color: Colors.white,
                  fontSize: 16.sp, // Text size responsive banaya
                  fontWeight: FontWeight.bold,
                  fontFamily: 'poppins',
                ),
              ),
      ),
    );
  }
}