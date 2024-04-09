



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: false,
      style: theme.textTheme.bodyMedium?.copyWith(
          fontSize: 15.sp
      ),
      decoration: InputDecoration(
        hintText: "Enter name or category",
        suffixIcon: Icon(CupertinoIcons.search, size: 20.h,),
      ),
    );
  }
}
