import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/Core/Constants/app_colors.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
        color: const Color(0xFF081A36),
        borderRadius: BorderRadius.circular(15.r),
      ),

      child: Row(
        children: [
          Icon(Icons.search, color: Colors.white, size: 22.sp),
          SizedBox(width: 10.w),
          Expanded(
            child: TextField(
              style: TextStyle(color: Colors.white, fontSize: 14.sp),
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.white54, fontSize: 14.sp),
                border: InputBorder.none,
              ),
            ),
          ),
          Icon(Icons.tune, color: Colors.white, size: 22.sp),
        ],
      ),
    );
  }
}
