

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/core/themes/theme_export.dart';
import 'package:travel_app/src/category/presentation/widgets/category_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "GoGo",
                      style: theme.textTheme.headlineLarge?.copyWith(
                          fontSize: 34.sp,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    SvgPicture.asset("assets/icons/map.svg")
                  ],
                ),
                SizedBox(height: 8.h,),
                Text(
                  'Choose Another',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: AppColor.textColor.withOpacity(0.5),
                  ),
                ),
                SizedBox(height: 24.h,),
                GestureDetector(
                  onTap: () {},
                  child: TextField(
                    enabled: false,
                    style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 15.sp
                    ),
                    decoration: InputDecoration(
                      hintText: "Enter name or category",
                      suffixIcon: Icon(CupertinoIcons.search, size: 20.h,),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 28.h,),
          const CategoryCard()
        ],
      )
    );
  }
}
