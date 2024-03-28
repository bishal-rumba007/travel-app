



import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/themes/theme_export.dart';
import 'package:travel_app/src/home/data/datasource/popular_destination_mock_datasource.dart';
import 'package:travel_app/src/home/data/repositories/popular_destination_repository_impl.dart';
import 'package:travel_app/src/home/domain/usecases/get_popular_destinations.dart';
import 'package:travel_app/src/home/presentation/blocs/popular_destinations_bloc.dart';
import 'package:travel_app/src/home/presentation/blocs/popular_destinations_event.dart';
import 'package:travel_app/src/home/presentation/blocs/popular_destinations_state.dart';

class PopularDestinationCard extends StatefulWidget {
  const PopularDestinationCard({super.key});

  @override
  State<PopularDestinationCard> createState() => _PopularDestinationCardState();
}

class _PopularDestinationCardState extends State<PopularDestinationCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        BlocProvider(
          create: (_) => PopularDestinationsBloc(
            getPopularDestinations: GetPopularDestinations(
              PopularDestinationsRepositoryImpl(
                mockDataSource: PopularDestinationsMockDataSourceImpl()
              )
            ),
          )..add(FetchPopularDestinations()),
          child: BlocBuilder<PopularDestinationsBloc, PopularDestinationsState>(
            builder: (context, state) {
              if(state is PopularDestinationsInitial){
                return const Text('Initial');
              }else if(state is PopularDestinationsLoading){
                return const CircularProgressIndicator.adaptive();
              }else if(state is PopularDestinationsError){
                return Text(state.message);
              }else if(state is PopularDestinationsLoaded){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Text(
                        "Popular",
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    SizedBox(
                      height: 280.h,
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              final destination = state.popularDestinations[index];
                              return Container(
                                margin: index == 0
                                    ? EdgeInsets.only(left: 24.w)
                                    : (index == state.popularDestinations.length - 1 ? EdgeInsets.only(right: 24.w) : null),
                                padding: EdgeInsets.all(16.w),
                                width: 212.w,
                                height: 280.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28.r),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(destination.destinationImageUrl!)
                                  )
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional.topEnd,
                                      child: CircleAvatar(
                                        radius: 20.r,
                                        backgroundColor: Colors.white,
                                        child: IconButton(
                                          onPressed: (){},
                                          icon: const Icon(Icons.favorite, color: AppColor.primaryColor,),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 120.h,),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                                      child: Text(
                                        destination.destinationName,
                                        style: theme.textTheme.bodyLarge?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: theme.colorScheme.inversePrimary
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8.h,),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                                      child: SizedBox(
                                        width: 53.w,
                                        height: 28.h,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(20.r),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(sigmaX: 32, sigmaY: 32),
                                            child: Container(
                                              padding: EdgeInsets.all(4.w),
                                              decoration: BoxDecoration(
                                                color: Colors.white.withOpacity(0.0),
                                              ),
                                              child: Center(
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                   const Icon(Icons.star, color: Colors.yellow, size: 16,),
                                                    Text(
                                                      "${destination.rating}",
                                                      style: theme.textTheme.labelSmall?.copyWith(
                                                        fontSize: 13.sp,
                                                        color: theme.colorScheme.inversePrimary
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (_, __) => SizedBox(
                              width: 12.w,
                            ),
                          itemCount: state.popularDestinations.length,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                        ),
                    )
                  ],
                );
              }else{
                return const Text('Unknown state');
              }
            },
          ),
        ),
      ]
    );
  }
}
