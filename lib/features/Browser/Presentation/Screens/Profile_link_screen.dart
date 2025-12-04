import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// --- Imports ---
import 'package:flutter_application_1/Core/Constants/app_colors.dart';

class LinkProfile extends StatefulWidget {
  const LinkProfile({super.key});

  @override
  State<LinkProfile> createState() => _LinkProfileState();
}

class _LinkProfileState extends State<LinkProfile> {
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

                   GestureDetector(
  onTap: _showLinkDialog,   // <-- CLICK EVENT
  child: Container(
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
      "Link",
      style: TextStyle(
        color: Colors.white,
        fontSize: 12.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
)

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


void _showLinkDialog() {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.all(20.w),
        child: Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: const Color(0xFF001633),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              // --- Profile Circle ---
              Container(
                width: 70.w,
                height: 70.w,
                decoration: const BoxDecoration(
                  color: Colors.white12,
                  shape: BoxShape.circle,
                ),
              ),

              SizedBox(height: 20.h),

              // --- Title ---
              Text(
                "Link for Browser\nComments",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10.h),

              // --- Subtitle ---
              Text(
                "Are you sure you want to link this profile for the browser "
                "comment so any user can comment there.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 13.sp,
                ),
              ),

              SizedBox(height: 20.h),

              // --- Dropdown ---
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                decoration: BoxDecoration(
                  color: const Color(0xFF0A2348),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    dropdownColor: const Color(0xFF0A2348),
                    value: "Browser comments & Profile Comments",
                    items: [
                      "Browser comments & Profile Comments",
                      "Browser Comments Only",
                      "Profile Comments Only"
                    ]
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {},
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              // --- OKAY Button ---
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppColors.primaryCyan, AppColors.primaryBlue],
                    ),
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Okay",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

}