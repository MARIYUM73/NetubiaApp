import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// --- Imports ---
import 'package:flutter_application_1/Core/Constants/app_colors.dart';
import 'package:flutter_application_1/Core/Common/Widgets/primary_button.dart';
import 'package:flutter_application_1/Core/Common/Widgets/Custom_textfield.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'OTP.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  // Password visibility variables
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Keyboard anay par content upar scroll ho sakay
      resizeToAvoidBottomInset: true, 
      body: SafeArea(
        // --- 1. SINGLE CHILD SCROLL VIEW ADDED ---
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),

              // --- Custom App Bar (Back Button) ---
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.whiteText,
                  size: 20.sp,
                ),
              ),

              SizedBox(height: 40.h),

              // --- Headings ---
              Text(
                "Phone Number",
                style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                "Please enter your phone number",
                style: TextStyle(
                  color: AppColors.offWhiteText,
                  fontSize: 14.sp,
                ),
              ),

              SizedBox(height: 15.h),

              // --- Mobile Number Input ---
              CustomTextField(
                hintText: "Phone Number",
                prefixIcon: Container(
                  width: 135.w,
                  padding: EdgeInsets.only(left: 15.w, right: 5.w),
                  alignment: Alignment.centerLeft,
                  child: CountryCodePicker(
                    onChanged: (country) {
                      print("Selected: ${country.dialCode}");
                    },
                    initialSelection: 'US',
                    favorite: const ['+1', 'US', 'PK'],
                    searchDecoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: "Search Country",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      contentPadding: const EdgeInsets.all(10),
                    ),
                    textStyle: const TextStyle(color: Colors.white),
                    dialogTextStyle: const TextStyle(color: Colors.black),
                    dialogBackgroundColor: Colors.white,
                    builder: (countryCode) {
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 24.w,
                            height: 24.w,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Image.asset(
                              countryCode!.flagUri!,
                              package: 'country_code_picker',
                              fit: BoxFit.cover,
                              width: 24.w,
                              height: 24.w,
                            ),
                          ),
                          SizedBox(width: 6.w),
                          Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 18.sp),
                          SizedBox(width: 4.w),
                          Text(
                            countryCode.dialCode!,
                            style: TextStyle(
                              color: AppColors.whiteText,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Container(
                            height: 24.h,
                            width: 1.5,
                            color: Colors.white.withOpacity(0.3),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),

              SizedBox(height: 30.h),

              // --- Headings ---
              Text(
                "Set Password",
                style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                "Please set your password",
                style: TextStyle(
                  color: AppColors.offWhiteText,
                  fontSize: 14.sp,
                ),
              ),

              SizedBox(height: 30.h),

              // --- Password Field ---
              Text(
                "Set Password",
                style: TextStyle(color: AppColors.offWhiteText, fontSize: 14.sp),
              ),
              SizedBox(height: 10.h),
              CustomTextField(
                hintText: "Password",
                obscureText: !_isPasswordVisible,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: AppColors.offWhiteText,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),

              SizedBox(height: 15.h),

              // --- Confirm Password Field ---
              CustomTextField(
                hintText: "Confirm Password",
                obscureText: !_isConfirmPasswordVisible,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: AppColors.whiteText,
                  ),
                  onPressed: () {
                    setState(() {
                      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                    });
                  },
                ),
              ),

              SizedBox(height: 30.h),

              // --- Password Requirements ---
              _buildRequirementItem("At least 12 characters long but 14 or more is better."),
              SizedBox(height: 10.h),
              _buildRequirementItem("A combination of uppercase letters, lowercase letters, numbers, and symbols."),

              // --- 2. SPACER REMOVED (Replaced with SizedBox for Gap) ---
              SizedBox(height: 50.h), 

              // --- Continue Button ---
              PrimaryButton(
                title: "Continue",
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const OTPVerificationScreen()), );
                },
              ),

              SizedBox(height: 30.h), // Bottom padding
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget for bullet points
  Widget _buildRequirementItem(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "• ",
          style: TextStyle(color: AppColors.offWhiteText, fontSize: 12.sp),
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.offWhiteText,
              fontSize: 12.sp,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}