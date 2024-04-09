import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/src/search/presentation/bloc/search_bloc.dart';
import 'package:travel_app/src/search/presentation/bloc/search_event.dart';
import 'package:travel_app/src/search/presentation/bloc/search_state.dart';

class SearchDestinationScreen extends StatefulWidget {
  const SearchDestinationScreen({super.key});

  @override
  State<SearchDestinationScreen> createState() =>
      _SearchDestinationScreenState();
}

class _SearchDestinationScreenState extends State<SearchDestinationScreen> {
  late SearchBloc _searchBloc;

  @override
  void initState() {
    super.initState();
    _searchBloc = context.read<SearchBloc>();
  }

  @override
  void dispose() {
    _searchBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () async => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Search Destinations'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(
                height: 16.h,
              ),
              TextField(
                onChanged: (value) {
                  _searchBloc.add(Search(query: value));
                },
                style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 15.sp
                ),
                decoration: InputDecoration(
                  hintText: "Enter name or category",
                  suffixIcon: Icon(CupertinoIcons.search, size: 20.h,),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const SizedBox(),
                    loading: () => const Center(child: CircularProgressIndicator.adaptive()),
                    loaded: (results) {
                      return results.isEmpty ? const Center(
                        child: Text('No results found'),
                      ) :
                      ListView.builder(
                        itemCount: results.length,
                        itemBuilder: (context, index) {
                          final result = results[index];
                          return ListTile(
                            title: Text(result.destinationName),
                            subtitle: Text(result.category),
                          );
                        },
                      );
                    },
                    error: (message) => Center(
                      child: Text(message),
                    )
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}