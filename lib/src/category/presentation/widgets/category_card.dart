import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/core/themes/theme_export.dart';
import 'package:travel_app/src/category/data/datasource/destination_category_mock_datasource.dart';
import 'package:travel_app/src/category/data/repositories/destination_category_repository_impl.dart';
import 'package:travel_app/src/category/domain/entities/destination_category.dart';
import 'package:travel_app/src/category/domain/usecases/get_destination_category.dart';
import 'package:travel_app/src/category/presentation/bloc/category_destination_bloc.dart';
import 'package:travel_app/src/category/presentation/bloc/category_destination_event.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            "Category",
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        SizedBox(
          height: 52.h,
          child:BlocProvider(
            create: (_) => DestinationCategoryBloc(
              getDestinationCategory: GetDestinationCategory(
                  DestinationCategoryRepositoryImpl(
                      mockDataSource: DestinationCategoryMockDataSourceImpl()
                  )
              ),
            )..add(FetchDestinationCategory()),
            child: BlocBuilder<DestinationCategoryBloc, List<DestinationCategory>>(
              builder: (context, state) {
                return state.isEmpty
                    ? const Center(child: Text('No Categories!!'))
                    : ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return buildSvgContainer(index, state, theme);
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    width: 12.w,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Container buildSvgContainer(
      int index, List<DestinationCategory> state, ThemeData theme) {
    return Container(
      margin: index == 0
          ? EdgeInsets.only(left: 24.w)
          : (index == state.length - 1 ? EdgeInsets.only(right: 24.w) : null),
      padding: EdgeInsets.only(left: 8.w, top: 8.h, right: 16.w, bottom: 8.h),
      height: 52.h,
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(7.h),
            height: 36.h,
            width: 36.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: getColorForCategory(int.parse(state[index].categoryId)),
            ),
            child: SvgPicture.asset(state[index].categoryImageUrl!),
          ),
          SizedBox(
            width: 8.w,
          ),
          Text(
            state[index].categoryName,
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  Color getColorForCategory(int categoryId) {
    switch (categoryId) {
      case 1:
        return AppColor.beige;
      case 2:
        return AppColor.cyanGreen;
      case 3:
        return AppColor.deepRed;
      default:
        return Colors.transparent; // Handle other cases if needed
    }
  }
}
