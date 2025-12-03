import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/presentation/Screens/SignupScreen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// --- Imports ---
import 'package:flutter_application_1/Core/Constants/app_colors.dart';
import 'package:flutter_application_1/Core/Constants/app_strings.dart';
import 'package:flutter_application_1/Core/Common/Widgets/primary_button.dart';
import 'package:flutter_application_1/Core/Common/Widgets/Custom_textfield.dart'; 
// Apna naya widget
import 'package:country_code_picker/country_code_picker.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Password show/hide variable
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background Color hata diya (Global Theme se Navy Blue uthayega)
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),

              // --- 1. Logo ---
              Center(
                child: SvgPicture.asset(
                  AppImages.appLogo,
                  width: 150.w,
                  height: 50.h,
                ),
              ),

              SizedBox(height: 50.h),

              // --- 2. Headings ---
              Text(
                "Login",
                style: TextStyle(
                  // Color hata diya -> Ye Global Theme se WHITE lega
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold, //
                ),
              ),
              SizedBox(height: 8.h),
              
              // Subtitle (Override: Grey)
              Text(
                "Welcome back! You've been missed!",
                style: TextStyle(
                  color: Color(0xFFFCFCFC), // Explicitly Grey
                  fontSize: 14.sp,
                ),
              ),

              SizedBox(height: 30.h),

              // --- 3. Mobile Number Input ---
              CustomTextField(
                hintText: "Mobile Number",
                // Container width fix for Country Picker
                prefixIcon: Container(
                  width: 115.w, 
                  padding: EdgeInsets.only(left: 10.w),
                  alignment: Alignment.centerLeft,
                  child: CountryCodePicker(
                    onChanged: (country) {
                      print("Selected: ${country.dialCode}");
                    },
                    initialSelection: 'US',
                    favorite: const ['+1', 'US', 'PK'],
                    
                    // Search Box Styling
                    searchDecoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: "Search Country",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      contentPadding: const EdgeInsets.all(10),
                    ),
                    dialogTextStyle: const TextStyle(color: Colors.black),
                    dialogBackgroundColor: Colors.white,

                    // Custom Builder (Flag + Arrow + Code)
                    builder: (countryCode) {
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Flag
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Image.asset(
                              countryCode!.flagUri!,
                              package: 'country_code_picker', 
                              width: 24.w,
                              height: 18.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 6.w),
                          // Arrow
                          Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 18.sp),
                          SizedBox(width: 6.w),
                          // Code
                          Text(
                            countryCode.dialCode!,
                            style: TextStyle(color: Colors.white, fontSize: 14.sp),
                          ),
                          SizedBox(width: 10.w),
                          // Divider
                          Container(
                            height: 20.h,
                            width: 1,
                            color: Colors.white.withOpacity(0.2),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),

              SizedBox(height: 15.h),

              // --- 4. Password Input ---
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

              // --- 5. Forgot Password (Override: Grey) ---
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(color: AppColors.offWhiteText, fontSize: 12.sp),
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              // --- 6. Login Button ---
              PrimaryButton(
                title: "Login",
                onPressed: () {
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const RegisterScreen()),  );
                },
              ),

              SizedBox(height: 30.h),

              // --- 7. Divider (Override: Grey) ---
      Row(
  mainAxisAlignment: MainAxisAlignment.center, // Center ma laany k liye
  children: [
    // --- Left Line ---
    SizedBox(
      width: 80.w, // Yahan apni marzi ki width dein (Expanded hata diya)
      child: Divider(
        color: AppColors.offWhiteText,
        thickness: 2, 
      ),
    ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      "Or continue with", 
                      style: TextStyle(color: AppColors.offWhiteText, fontSize: 12.sp)
                    ),
                  ),
                  // Right Line
                 SizedBox(
      width: 80.w, // Same width yahan dein
      child: Divider(
        color: AppColors.offWhiteText,
        thickness: 2, 
      ),
    ),
                ],
              ),

              SizedBox(height: 30.h),

              // --- 8. Social Buttons ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSocialButton(AppImages.google),
                  _buildSocialButton(AppImages.apple),
                  _buildSocialButton(AppImages.facebook),
                ],
              ),

              SizedBox(height: 30.h),

              // --- 9. Terms & Privacy (Grey Base + White Highlights) ---
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      color: AppColors.offWhiteText, // Base text Grey
                      fontSize: 11.sp,
                      height: 1.5,
                      fontFamily: 'Gilroy', // Global font inherit karega, but safe side k liye
                    ),
                    children: [
                      const TextSpan(text: "Continue with Google, Apple or Facebook, you agree to Netubia "),
                      TextSpan(
                        text: "Terms and Conditions",
                        style: const TextStyle(
                          color: AppColors.whiteText, // Highlight: White
                          fontWeight: FontWeight.bold, // Highlight: Bold
                        ),
                      ),
                      const TextSpan(text: " & "),
                      TextSpan(
                        text: "Privacy Policy",
                        style: const TextStyle(
                          color: AppColors.whiteText, // Highlight: White
                          fontWeight: FontWeight.bold, // Highlight: Bold
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 30.h),

              // --- 10. Register Text (Grey Base + Blue Highlight) ---
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Not a member? ",
                    style: TextStyle(
                      color: AppColors.offWhiteText, // Base text Grey
                      fontSize: 14.sp,
                      fontFamily: 'Gilroy',
                    ),
                    children: [
                      TextSpan(
                        text: "Register Yourself",
                        style: TextStyle(
                          color: AppColors.primaryCyan, // Highlight: Cyan/Blue
                          fontWeight: FontWeight.bold,  // Highlight: Bold
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  // Social Button Helper
  Widget _buildSocialButton(String assetPath) {
    return Container(
      width: 60.w,
      height: 60.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFF000C24),
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: SvgPicture.asset(
        assetPath,
        width: 28.w,
        height: 28.h,
        fit: BoxFit.contain,
      ),
    );
  }
}