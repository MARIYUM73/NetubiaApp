import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// --- Imports ---
import 'package:flutter_application_1/Core/Constants/app_colors.dart';

// --- Clean Architecture Imports ---
import '../../domain/notification_model.dart';      // Model
import '../../data/notification_repo.dart';   // Data

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // Data hold karne k liye variables
  late List<NotificationModel> todayNotifications;
  late List<NotificationModel> olderNotifications;

  @override
  void initState() {
    super.initState();
    // Screen shuru hoty hi Data Repository se data load kar lia
    todayNotifications = NotificationRepository.getTodayNotifications();
    olderNotifications = NotificationRepository.getOlderNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background handled by Global Theme
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20.h),

            // --- 1. Header ---
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back_ios, color: AppColors.whiteText, size: 20.sp),
                  ),
                  Text(
                    "Notifications",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.whiteText,
                    ),
                  ),
                  SizedBox(width: 20.w),
                ],
              ),
            ),

            SizedBox(height: 20.h),

            // --- 2. Scrollable List ---
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    // --- Today Section ---
                    if (todayNotifications.isNotEmpty) ...[
                      Text("Today", style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.bold)),
                      SizedBox(height: 15.h),
                      
                      // Loop through Data
                      ...List.generate(todayNotifications.length, (index) {
                        return _buildNotificationItem(todayNotifications[index], index, isToday: true);
                      }),
                      
                      SizedBox(height: 20.h),
                    ],

                    // --- Older Section ---
                    if (olderNotifications.isNotEmpty) ...[
                      Text("Older", style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.bold)),
                      SizedBox(height: 15.h),

                      // Loop through Data
                      ...List.generate(olderNotifications.length, (index) {
                        return _buildNotificationItem(olderNotifications[index], index, isToday: false);
                      }),
                      
                      SizedBox(height: 20.h),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Helper Widget ---
  // Note: Ab yahan 'Map' ki jagah 'NotificationModel' use ho raha hai (Type Safe)
  Widget _buildNotificationItem(NotificationModel data, int index, {required bool isToday}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Dismissible(
        key: Key(data.name + index.toString()),
        direction: DismissDirection.endToStart,
        background: Container(
          padding: EdgeInsets.only(right: 20.w),
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
            color: const Color(0xFFFF5C5C),
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.delete_outline, color: Colors.white, size: 24.sp),
              Text("Delete", style: TextStyle(color: Colors.white, fontSize: 10.sp)),
            ],
          ),
        ),
        onDismissed: (direction) {
          if (isToday) {
            setState(() => todayNotifications.removeAt(index));
          } else {
            setState(() => olderNotifications.removeAt(index));
          }
        },
        child: Container(
          color: Colors.transparent,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image/Icon (Using data.image placeholder)
              Container(
                width: 50.w, height: 50.w,
                decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                clipBehavior: Clip.hardEdge,
                child: Icon(Icons.person, color: Colors.white, size: 30.sp), // Image.asset use kr skty hain
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(data.name, style: TextStyle(color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.bold)),
                        SizedBox(width: 5.w),
                        if (data.isVerified) Icon(Icons.verified, color: AppColors.primaryCyan, size: 16.sp),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Text(data.message, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white70, fontSize: 12.sp)),
                  ],
                ),
              ),
              SizedBox(width: 10.w),
              Text(data.time, style: TextStyle(color: Colors.white54, fontSize: 11.sp)),
            ],
          ),
        ),
      ),
    );
  }
}