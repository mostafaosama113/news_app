import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/shared/components/components.dart';

class SportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) => ConditionalBuilder(
        condition: NewsCubit.get(context).sports.length > 0,
        builder: (context) => ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return buildArticaleItem(
                  context, NewsCubit.get(context).sports[index]);
            },
            separatorBuilder: (context, index) => getSeperatedLine(),
            itemCount: NewsCubit.get(context).sports.length),
        fallback: (context) => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
