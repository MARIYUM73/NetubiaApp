import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

//import '../widgets/searchbar_screen.dart';
import '../widgets/messsage_title.dart';
import 'package:flutter_application_1/Core/Constants/app_colors.dart';
import 'package:flutter_application_1/features/Messages/presentation/Widgets/searchbar_screen.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgcolor, // deep navy

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              SizedBox(height: 20.h),

              // --- TOP BAR ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Edit",
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  ),

                  Stack(
                    children: [
                      Icon(Icons.notifications_none, color: Colors.white, size: 26.sp),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          width: 8.w,
                          height: 8.w,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),

              SizedBox(height: 10.h),

              // --- TITLE ---
              Text(
                "Messages",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20.h),

              // --- SEARCH BAR ---
             const CustomSearchBar(),

              SizedBox(height: 20.h),

              // --- LIST OF MESSAGES ---
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    MessageTile(
                      image: "assets/images/u1.png",
                      name: "Jaxson Vetrovs",
                      message: "Okay...Do we have a deal?",
                      date: "18 Aug, 2023",
                      unread: 2,
                      onlineColor: Colors.green,
                    ),

                    MessageTile(
                      image: "assets/images/u2.png",
                      name: "Emerson Calzoni",
                      message: "It's nice working with you 😄",
                      date: "12 Aug, 2023",
                      unread: 5,
                      onlineColor: Colors.green,
                    ),

                    MessageTile(
                      image: "assets/images/u3.png",
                      name: "Carter Lubin",
                      message: "Wow, this is really epic 🔥🔥",
                      date: "08 Aug, 2023",
                      unread: 0,
                      onlineColor: Colors.orange,
                    ),

                    MessageTile(
                      image: "assets/images/u4.png",
                      name: "Jakob Dokidis",
                      message: "It's nice working with you 😄",
                      date: "05 Aug, 2023",
                      unread: 0,
                      onlineColor: Colors.green,
                    ),

                    MessageTile(
                      image: "assets/images/u5.png",
                      name: "Zain Baptista",
                      message: "Will the contract be sent? 🤔",
                      date: "02 Aug, 2023",
                      unread: 0,
                      onlineColor: Colors.orange,
                    ),

                    MessageTile(
                      image: "assets/images/u6.png",
                      name: "Jaydon Bator",
                      message: "Wow, this is really epic 🔥🔥",
                      date: "29 Jul, 2023",
                      unread: 0,
                      onlineColor: Colors.orange,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
