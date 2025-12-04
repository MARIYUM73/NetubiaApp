import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/Core/Constants/app_colors.dart';

class MessageTile extends StatelessWidget {
  final String image;
  final String name;
  final String message;
  final String date;
  final int unread;
  final Color onlineColor;

  const MessageTile({
    super.key,
    required this.image,
    required this.name,
    required this.message,
    required this.date,
    required this.unread,
    required this.onlineColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 18.h),
      child: Row(
        children: [
          // --- USER IMAGE + ONLINE DOT ---
          Stack(
            children: [
              Container(
                width: 55.w,
                height: 55.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
                  border: Border.all(color: AppColors.primaryCyan, width: 2),
                ),
              ),

              Positioned(
                right: 2,
                bottom: 2,
                child: Container(
                  width: 12.w,
                  height: 12.w,
                  decoration: BoxDecoration(
                    color: onlineColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1.5),
                  ),
                ),
              )
            ],
          ),

          SizedBox(width: 15.w),

          // --- NAME + MESSAGE ---
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  message,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13.sp,
                  ),
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),

          // --- RIGHT SIDE: UNREAD + DATE ---
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (unread > 0)
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: const BoxDecoration(
                    color: AppColors.primaryBlue,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    unread.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              SizedBox(height: 5.h),
              Text(
                date,
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 12.sp,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
