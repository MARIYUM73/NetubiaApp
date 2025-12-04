import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// --- Imports ---
import 'package:flutter_application_1/Core/Constants/app_colors.dart';

class SearchUserChatScreen extends StatefulWidget {
  const SearchUserChatScreen({super.key});

  @override
  State<SearchUserChatScreen> createState() => _SearchUserChatScreenState();
}

class _SearchUserChatScreenState extends State<SearchUserChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000C24), // Deep Navy Background
      body: SafeArea(
        child: Stack(
          children: [
            
            // --- 1. Top Bar (Address Bar) ---
            Positioned(
              top: 10.h,
              left: 24.w,
              right: 24.w,
              child: Row(
                children: [
                  // Done Text
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      "Done",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  
                  SizedBox(width: 15.w),

                  // Search Address Bar
                  Expanded(
                    child: Container(
                      height: 40.h,
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      decoration: BoxDecoration(
                        color: const Color(0xFF061229), // Slightly lighter than BG
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.lock, color: Colors.white, size: 14.sp),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: Text(
                              "www.google.com",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(width: 15.w),

                  // Bookmark Icon (Blue Gradient Circle)
                  Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [AppColors.primaryCyan, AppColors.primaryBlue],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Icon(Icons.bookmark_border, color: Colors.white, size: 20.sp),
                  ),
                ],
              ),
            ),

            // --- 2. Floating Action Buttons (Right Side) ---
            Positioned(
              bottom: 80.h, // Bottom Bar k upar
              right: 24.w,
              child: Column(
                children: [
                  // Info Button
                  _buildCircleButton(icon: Icons.error_outline),
                  SizedBox(height: 15.h),
                  // Chat/Comments Button
                  _buildCircleButton(icon: Icons.chat_bubble_outline),
                ],
              ),
            ),

            // --- 3. Custom Bottom Browser Bar ---
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 70.h,
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                decoration: const BoxDecoration(
                  color: Color(0xFF000C24), // Match Background
                  border: Border(top: BorderSide(color: Colors.white10)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Back Arrow
                    Icon(Icons.arrow_back, color: AppColors.primaryCyan, size: 24.sp),
                    
                    // Forward Arrow
                    Icon(Icons.arrow_forward, color: Colors.white, size: 24.sp),
                    
                    // Plus Icon
                    Icon(Icons.add, color: Colors.white, size: 28.sp),
                    
                    // Tab Count (Square Box)
                    Container(
                      width: 24.w,
                      height: 24.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1.5),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Text(
                        "12",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // Message Button (Blue Gradient Pill)
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [AppColors.primaryCyan, AppColors.primaryBlue],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        "Message",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Helper: Circular Floating Buttons ---
  Widget _buildCircleButton({required IconData icon}) {
    return Container(
      width: 50.w,
      height: 50.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [AppColors.primaryCyan, AppColors.primaryBlue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Icon(icon, color: Colors.white, size: 24.sp),
    );
  }
}